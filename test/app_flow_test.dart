import 'package:employee_system/app.dart';
import 'package:employee_system/features/auth/auth.dart';
import 'package:employee_system/features/employees/employees.dart';
import 'package:employee_system/features/organization/organization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_auth_service.dart';
import 'support/fake_employee_service.dart';
import 'support/fake_organization_info_service.dart';
import 'support/sample_data.dart';

void main() {
  testWidgets('رحلة كاملة: دخول، عرض الموظفين، طباعة، إدارة مستخدمين، خروج', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final authService = FakeAuthService();
    await authService.ensureDefaultAdmin();

    final employeeService = FakeEmployeeService(buildSampleEmployees());
    final organizationService = FakeOrganizationInfoService(
      buildSampleOrganizationInfo(),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authServiceProvider.overrideWithValue(authService),
          employeeServiceProvider.overrideWithValue(employeeService),
          organizationInfoServiceProvider.overrideWithValue(
            organizationService,
          ),
        ],
        child: const EmployeeSystemApp(),
      ),
    );
    await tester.pumpAndSettle();

    // 1) شاشة تسجيل الدخول تظهر أولاً.
    expect(find.text('تسجيل الدخول للمتابعة إلى النظام'), findsOneWidget);

    // 2) تسجيل الدخول بحساب المدير الافتراضي.
    await tester.enterText(
      find.widgetWithText(TextFormField, 'اسم المستخدم'),
      DefaultAdminCredentials.username,
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'كلمة المرور'),
      DefaultAdminCredentials.password,
    );
    await tester.tap(find.text('تسجيل الدخول'));
    await tester.pumpAndSettle();

    expect(find.text('لوحة التحكم'), findsWidgets);

    // 3) الانتقال إلى شاشة إدارة الموظفين والتأكد من ظهور البيانات التجريبية.
    await tester.tap(find.text('إدارة الموظفين').first);
    await tester.pumpAndSettle();

    expect(find.text('أحمد كريم عبدالله'), findsWidgets);
    expect(find.text('زينب علي حسين'), findsWidgets);

    // 4) فتح تفاصيل موظف والتأكد من عرض بياناته.
    await tester.ensureVisible(find.byTooltip('عرض').first);
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('عرض').first);
    await tester.pumpAndSettle();

    expect(find.text('تفاصيل الموظف'), findsOneWidget);

    // 5) الطباعة الفعلية من نافذة التفاصيل تفتح معاينة PDF حقيقية.
    // لا نستخدم pumpAndSettle هنا لأن PdfPreview يُبقي جدولة رسوم مستمرة
    // (تمرير/تكبير) لا تستقر تلقائياً.
    await tester.tap(find.text('طباعة'));
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(find.byTooltip('إغلاق المعاينة'), findsOneWidget);

    await tester.tap(find.byTooltip('إغلاق المعاينة'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // 6) الانتقال إلى شاشة إدارة المستخدمين (متاحة للمدير) والتأكد من وجود
    // حساب المدير الافتراضي فيها.
    await tester.tap(find.text('إدارة المستخدمين').first);
    await tester.pumpAndSettle();

    expect(find.text(DefaultAdminCredentials.fullName), findsWidgets);

    // 7) تسجيل الخروج يعيد المستخدم إلى شاشة تسجيل الدخول.
    await tester.tap(find.byTooltip('تسجيل الخروج'));
    await tester.pumpAndSettle();

    expect(find.text('تسجيل الدخول للمتابعة إلى النظام'), findsOneWidget);
  });
}
