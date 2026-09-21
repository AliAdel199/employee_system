import 'dart:convert';
import 'dart:io';

import 'package:employee_system/features/backup/backup.dart';
import 'package:employee_system/features/employees/employees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';

import 'support/fake_backup_service.dart';
import 'support/fake_employee_service.dart';
import 'support/fake_file_selector_platform.dart';
import 'support/sample_data.dart';

/// اختبار على مستوى الواجهة الفعلية لصفحة BackupPage: يضغط فعلياً على أزرارها
/// الحقيقية عبر ProviderScope overrides لخدمة الموظفين وخدمة النسخ الاحتياطي،
/// مع الإبقاء على خدمة تصدير/استيراد الموظفين الحقيقية (EmployeeTransferService)
/// لأنها لا تعتمد على Isar مباشرة. نافذة اختيار/حفظ الملفات وحدها مُحاكاة لأنها
/// نافذة نظام تشغيل حقيقية لا يمكن أتمتتها في أي بيئة اختبار.
///
/// ملاحظة بيئية: خدمة Isar الحقيقية (BackupService/EmployeeService) لا تكتمل
/// عند استدعائها من داخل معالج ضغطة زر ضمن flutter_test (تتعطل بلا حدود زمني
/// بسبب طريقة تعامل AutomatedTestWidgetsFlutterBinding مع نداءات Isolate
/// الأصلية) — لذا يجري التحقق من منطق Isar الحقيقي بشكل منفصل في
/// backup_test.dart (بدون محاكاة ضغطات الأزرار)، بينما يتحقق هذا الملف من أن
/// الواجهة نفسها تستدعي الخدمات الصحيحة وتعرض النتائج الصحيحة.
/// بديل عن pumpAndSettle للخطوات التي تنطوي على كتابة/قراءة ملفات حقيقية:
/// pumpAndSettle قد يتوقف فوراً دون انتظار اكتمال عملية IO حقيقية لأنها لا
/// ترتبط بإطار أو مؤقّت مجدوَل يعرفه المحرّك الوهمي للاختبار.
Future<void> _settle(WidgetTester tester) async {
  for (var i = 0; i < 5; i++) {
    await tester.pump();
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 500)),
    );
  }
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 200));
}

void main() {
  late Directory fileDialogDirectory;
  late FakeFileSelectorPlatform fakeFileSelector;
  late FakeEmployeeService fakeEmployeeService;
  late FakeBackupService fakeBackupService;

  setUp(() {
    fileDialogDirectory = Directory.systemTemp.createTempSync(
      'employee_system_backup_ui_dialogs_',
    );
    fakeFileSelector = FakeFileSelectorPlatform(
      workDirectory: fileDialogDirectory,
    );
    FileSelectorPlatform.instance = fakeFileSelector;

    fakeEmployeeService = FakeEmployeeService(buildSampleEmployees());
    fakeBackupService = FakeBackupService();
  });

  tearDown(() {
    if (fileDialogDirectory.existsSync()) {
      fileDialogDirectory.deleteSync(recursive: true);
    }
  });

  Future<void> pumpBackupPage(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1000, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          employeeServiceProvider.overrideWithValue(fakeEmployeeService),
          backupServiceProvider.overrideWithValue(fakeBackupService),
        ],
        child: const MaterialApp(
          locale: Locale('ar'),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(body: BackupPage()),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('زر إنشاء نسخة احتياطية يستدعي الخدمة ويعرض رسالة النجاح', (
    tester,
  ) async {
    await pumpBackupPage(tester);

    await tester.tap(find.text('إنشاء نسخة احتياطية'));
    await tester.pumpAndSettle();

    expect(fakeBackupService.lastBackupPath, isNotNull);
    expect(fakeBackupService.lastBackupPath, endsWith('.isar'));
    expect(find.text('تم إنشاء النسخة الاحتياطية بنجاح.'), findsOneWidget);
  });

  testWidgets(
    'زر الاستعادة يطلب تأكيداً ثم يستدعي الخدمة ويعرض رسالة الاكتمال',
    (tester) async {
      await pumpBackupPage(tester);

      fakeFileSelector.nextOpenFilePath = '${fileDialogDirectory.path}/x.isar';
      await tester.tap(find.text('استعادة من نسخة احتياطية'));
      await tester.pumpAndSettle();

      expect(find.text('تأكيد الاستعادة'), findsOneWidget);
      expect(fakeBackupService.lastRestorePath, isNull);

      await tester.tap(find.text('استعادة'));
      await tester.pumpAndSettle();

      expect(fakeBackupService.lastRestorePath, '${fileDialogDirectory.path}/x.isar');
      expect(find.text('تمت الاستعادة'), findsOneWidget);

      await tester.tap(find.text('حسناً'));
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'تصدير فعلي لملف موظفين ثم استيراده ودمجه من نفس الواجهة',
    timeout: const Timeout(Duration(seconds: 20)),
    (tester) async {
    await pumpBackupPage(tester);

    // 1) تصدير فعلي عبر الضغط على الزر الحقيقي بالواجهة، بكتابة ملف JSON
    // حقيقي على القرص عبر EmployeeTransferService الحقيقية.
    await tester.tap(find.text('تصدير إلى ملف'));
    await _settle(tester);

    expect(find.text('تم تصدير 4 موظف بنجاح.'), findsOneWidget);

    final exportedFiles = fileDialogDirectory
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.json'))
        .toList();
    expect(exportedFiles, hasLength(1));

    final exportedContent =
        jsonDecode(exportedFiles.first.readAsStringSync())
            as Map<String, dynamic>;
    expect((exportedContent['employees'] as List), hasLength(4));

    // 2) تعديل الملف المُصدَّر يدوياً لمحاكاة موظف عُدِّل بجهاز آخر بتاريخ
    // أحدث، للتحقق من أن الاستيراد الفعلي عبر الواجهة يطبّق سياسة الدمج.
    final employees = List<Map<String, dynamic>>.from(
      exportedContent['employees'] as List,
    );
    final targetIndex = employees.indexWhere(
      (item) => item['nationalNumber'] == '19900314001',
    );
    employees[targetIndex] = {
      ...employees[targetIndex],
      'jobTitle': 'محاسب أول (محدَّث من جهاز آخر)',
      'updatedAt': DateTime.now()
          .add(const Duration(days: 1))
          .toIso8601String(),
    };
    exportedContent['employees'] = employees;
    exportedFiles.first.writeAsStringSync(jsonEncode(exportedContent));

    // 3) استيراد فعلي عبر الضغط على الزر الحقيقي، مع محاكاة اختيار نفس ملف
    // التصدير المُعدَّل، وقراءته فعلياً من القرص.
    fakeFileSelector.nextOpenFilePath = exportedFiles.first.path;
    await tester.tap(find.text('استيراد من ملف'));
    await _settle(tester);

    expect(find.text('نتيجة الاستيراد'), findsOneWidget);
    expect(
      find.textContaining('تم تحديث 1 موظف ببيانات أحدث'),
      findsOneWidget,
    );
    await tester.tap(find.text('حسناً'));
    await tester.pumpAndSettle();

    final updatedEmployee = await fakeEmployeeService
        .getEmployeeByNationalNumber('19900314001');
    expect(updatedEmployee!.jobTitle, 'محاسب أول (محدَّث من جهاز آخر)');
  },
  );
}
