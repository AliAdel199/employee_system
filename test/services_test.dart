import 'dart:io';

import 'package:employee_system/core/database/app_database.dart';
import 'package:employee_system/features/auth/data/services/auth_service.dart';
import 'package:employee_system/features/auth/data/models/user_model.dart';
import 'package:employee_system/features/employees/employees.dart';
import 'package:employee_system/features/organization/organization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import 'support/fake_path_provider.dart';
import 'support/sample_data.dart';

void main() {
  late Directory tempDirectory;

  setUpAll(() async {
    // يحمّل مكتبة Isar الأصلية مرة واحدة (تُخزَّن محلياً) لتشغيل اختبارات
    // حقيقية على قاعدة البيانات بدل الاكتفاء بمزيّفات (fakes).
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    tempDirectory = Directory.systemTemp.createTempSync(
      'employee_system_services_test_',
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

  group('IsarAuthService', () {
    const service = IsarAuthService();

    test('ensureDefaultAdmin ينشئ حساب admin/admin123 مرة واحدة فقط', () async {
      expect(await service.hasAnyUser(), isFalse);

      await service.ensureDefaultAdmin();
      expect(await service.hasAnyUser(), isTrue);

      final loggedIn = await service.login(
        DefaultAdminCredentials.username,
        DefaultAdminCredentials.password,
      );
      expect(loggedIn, isNotNull);
      expect(loggedIn!.role, UserRole.admin);

      // استدعاء ثانٍ يجب ألا ينشئ مديراً إضافياً.
      await service.ensureDefaultAdmin();
      expect(await service.getUsers(), hasLength(1));
    });

    test('تسجيل الدخول بكلمة مرور خاطئة يفشل', () async {
      await service.ensureDefaultAdmin();

      final result = await service.login(
        DefaultAdminCredentials.username,
        'wrong-password',
      );
      expect(result, isNull);
    });

    test('لا يمكن إضافة مستخدم باسم مستخدم مكرر', () async {
      await service.createUser(
        username: 'manager1',
        fullName: 'مدير الفرع',
        password: '1234',
        role: UserRole.admin,
      );

      expect(await service.existsByUsername('manager1'), isTrue);
      expect(await service.existsByUsername('MANAGER1'), isTrue);
      expect(await service.existsByUsername('غير موجود'), isFalse);
    });

    test('countActiveAdmins يستثني المدير المطلوب استبعاده', () async {
      final admin = await service.createUser(
        username: 'admin1',
        fullName: 'مدير أول',
        password: '1234',
        role: UserRole.admin,
      );

      expect(await service.countActiveAdmins(), 1);
      expect(await service.countActiveAdmins(excludeId: admin.id), 0);
    });
  });

  group('IsarEmployeeService', () {
    const service = IsarEmployeeService();

    test('حفظ الموظفين واسترجاعهم والإحصاءات', () async {
      final samples = buildSampleEmployees();
      for (final employee in samples) {
        await service.saveEmployee(employee);
      }

      final all = await service.getEmployees();
      expect(all, hasLength(samples.length));

      final stats = await service.getStatistics();
      expect(stats.totalCount, samples.length);
      expect(stats.maleCount + stats.femaleCount, samples.length);
      expect(stats.maleCount, 2);
      expect(stats.femaleCount, 2);
    });

    test('البحث النصي يجد الموظف باسمه أو رقمه الوظيفي', () async {
      for (final employee in buildSampleEmployees()) {
        await service.saveEmployee(employee);
      }

      final byName = await service.getEmployees(
        filter: const EmployeeFilter(searchText: 'زينب'),
      );
      expect(byName, hasLength(1));
      expect(byName.first.fullName, contains('زينب'));

      final byEmployeeNumber = await service.getEmployees(
        filter: const EmployeeFilter(searchText: 'EMP-1003'),
      );
      expect(byEmployeeNumber, hasLength(1));
      expect(byEmployeeNumber.first.jobTitle, 'فني صيانة');
    });

    test('فلترة حسب الجنس والحالة الاجتماعية', () async {
      for (final employee in buildSampleEmployees()) {
        await service.saveEmployee(employee);
      }

      final females = await service.getEmployees(
        filter: const EmployeeFilter(gender: Gender.female),
      );
      expect(females, hasLength(2));
      expect(females.every((e) => e.gender == Gender.female), isTrue);

      final married = await service.getEmployees(
        filter: const EmployeeFilter(maritalStatus: MaritalStatus.married),
      );
      expect(married, hasLength(1));
      expect(married.first.fullName, contains('أحمد'));
    });

    test('existsByNationalNumber يستثني السجل نفسه عند التعديل', () async {
      final saved = await service.saveEmployee(buildSampleEmployees().first);

      expect(
        await service.existsByNationalNumber(saved.nationalNumber),
        isTrue,
      );
      expect(
        await service.existsByNationalNumber(
          saved.nationalNumber,
          excludeId: saved.id,
        ),
        isFalse,
      );
    });

    test('حذف موظف يزيله من النتائج', () async {
      final saved = await service.saveEmployee(buildSampleEmployees().first);
      expect(await service.deleteEmployee(saved.id), isTrue);
      expect(await service.getEmployeeById(saved.id), isNull);
    });
  });

  group('IsarOrganizationInfoService', () {
    const service = IsarOrganizationInfoService();

    test('حفظ بيانات المؤسسة واسترجاعها كسجل واحد', () async {
      await service.saveOrganizationInfo(buildSampleOrganizationInfo());

      final saved = await service.getOrganizationInfo();
      expect(saved, isNotNull);
      expect(saved!.organizationName, 'دائرة نظام إدارة الموظفين');

      // الحفظ مرة ثانية يحدّث نفس السجل بدل إنشاء سجل جديد.
      final updated = buildSampleOrganizationInfo()
        ..organizationName = 'دائرة محدّثة';
      await service.saveOrganizationInfo(updated);

      final isar = await AppDatabase.open();
      final count = await isar.organizationInfoModels.where().count();
      expect(count, 1);
    });
  });
}
