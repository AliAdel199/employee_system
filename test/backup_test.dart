import 'dart:convert';
import 'dart:io';

import 'package:employee_system/core/database/app_database.dart';
import 'package:employee_system/features/backup/backup.dart';
import 'package:employee_system/features/employees/employees.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import 'support/fake_path_provider.dart';
import 'support/sample_data.dart';

void main() {
  late Directory tempDirectory;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    tempDirectory = Directory.systemTemp.createTempSync(
      'employee_system_backup_test_',
    );
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDirectory);
    await AppDatabase.initialize();
  });

  tearDown(() async {
    await AppDatabase.close();
    if (tempDirectory.existsSync()) {
      tempDirectory.deleteSync(recursive: true);
    }
  });

  group('IsarBackupService', () {
    const backupService = IsarBackupService();
    const employeeService = IsarEmployeeService();

    test('إنشاء نسخة احتياطية واستعادتها يعيد نفس البيانات', () async {
      for (final employee in buildSampleEmployees()) {
        await employeeService.saveEmployee(employee);
      }

      final backupFile = File(
        '${tempDirectory.path}/manual_backup.isar',
      ).path;
      await backupService.createBackup(backupFile);
      expect(File(backupFile).existsSync(), isTrue);

      // إضافة موظف بعد أخذ النسخة الاحتياطية، لن يظهر بعد الاستعادة.
      await employeeService.saveEmployee(
        EmployeeModel()
          ..fullName = 'موظف بعد النسخة الاحتياطية'
          ..nationalNumber = '99999999999',
      );
      expect(await employeeService.getEmployees(), hasLength(5));

      await backupService.restoreBackup(backupFile);

      // بعد الاستعادة يجب إعادة فتح قاعدة البيانات لقراءة المحتوى المستعاد.
      final reopened = await AppDatabase.open();
      final count = await reopened.employeeModels.where().count();
      expect(count, 4);
    });
  });

  group('EmployeeTransferService', () {
    const employeeService = IsarEmployeeService();
    const transferService = EmployeeTransferService();

    test('استيراد ملف مُصدَّر على جهاز فارغ يضيف كل الموظفين', () async {
      // التصدير يعمل على أي قائمة EmployeeModel مباشرة، دون الحاجة لحفظها
      // أولاً، لذا نحاكي هنا بيانات جهاز آخر بدون لمس قاعدة بيانات هذا الجهاز.
      final json = await transferService.exportToJson(buildSampleEmployees());

      final summary = await transferService.importFromJson(
        json,
        employeeService,
      );

      expect(summary.added, 4);
      expect(summary.updated, 0);
      expect(summary.skipped, 0);
      expect(await employeeService.getEmployees(), hasLength(4));
    });

    test(
      'السجل المستورد الأحدث تعديلاً يستبدل السجل المحلي الأقدم',
      () async {
        final local = await employeeService.saveEmployee(
          EmployeeModel()
            ..fullName = 'اسم قديم'
            ..nationalNumber = '11122233344'
            ..employeeNumber = 'EMP-9001'
            ..phoneNumber = '0770000000',
        );

        final incomingJson = {
          'formatVersion': 1,
          'employees': [
            {
              'fullName': 'اسم محدّث من جهاز آخر',
              'nationalNumber': '11122233344',
              'employeeNumber': 'EMP-9001',
              'phoneNumber': '0779999999',
              'createdAt': local.createdAt.toIso8601String(),
              'updatedAt': local.updatedAt
                  .add(const Duration(days: 1))
                  .toIso8601String(),
            },
          ],
        };

        final summary = await transferService.importFromJson(
          jsonEncode(incomingJson),
          employeeService,
        );

        expect(summary.updated, 1);
        expect(summary.added, 0);

        final updated = await employeeService.getEmployeeById(local.id);
        expect(updated!.fullName, 'اسم محدّث من جهاز آخر');
        expect(updated.phoneNumber, '0779999999');
      },
    );

    test('السجل المستورد الأقدم من السجل المحلي يُتجاهل', () async {
      final local = await employeeService.saveEmployee(
        EmployeeModel()
          ..fullName = 'الاسم المحلي الأحدث'
          ..nationalNumber = '55566677788'
          ..employeeNumber = 'EMP-9002'
          ..phoneNumber = '0771111111',
      );

      final incomingJson = {
        'formatVersion': 1,
        'employees': [
          {
            'fullName': 'اسم قديم من جهاز آخر',
            'nationalNumber': '55566677788',
            'employeeNumber': 'EMP-9002',
            'phoneNumber': '0772222222',
            'createdAt': local.createdAt.toIso8601String(),
            'updatedAt': local.updatedAt
                .subtract(const Duration(days: 1))
                .toIso8601String(),
          },
        ],
      };

      final summary = await transferService.importFromJson(
        jsonEncode(incomingJson),
        employeeService,
      );

      expect(summary.skipped, 1);
      expect(summary.updated, 0);
      expect(summary.added, 0);

      final unchanged = await employeeService.getEmployeeById(local.id);
      expect(unchanged!.fullName, 'الاسم المحلي الأحدث');
      expect(unchanged.phoneNumber, '0771111111');
    });
  });
}
