import 'package:employee_system/app.dart';
import 'package:employee_system/features/auth/auth.dart';
import 'package:employee_system/features/auth/data/services/password_hasher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

class _FakeAuthService implements AuthService {
  _FakeAuthService(this.users);

  final List<UserModel> users;

  @override
  Future<bool> hasAnyUser() async => users.isNotEmpty;

  @override
  Future<void> ensureDefaultAdmin() async {
    if (users.isNotEmpty) {
      return;
    }

    await createUser(
      username: DefaultAdminCredentials.username,
      fullName: DefaultAdminCredentials.fullName,
      password: DefaultAdminCredentials.password,
      role: UserRole.admin,
    );
  }

  @override
  Future<List<UserModel>> getUsers() async => List.of(users);

  @override
  Stream<List<UserModel>> watchUsers() => Stream.value(List.of(users));

  @override
  Future<UserModel?> getUserById(Id id) async {
    for (final user in users) {
      if (user.id == id) {
        return user;
      }
    }
    return null;
  }

  @override
  Future<UserModel?> login(String username, String password) async {
    for (final user in users) {
      if (user.username == username && user.isActive) {
        final isValid = PasswordHasher.verify(
          password,
          user.passwordSalt,
          user.passwordHash,
        );
        return isValid ? user : null;
      }
    }
    return null;
  }

  @override
  Future<UserModel> createUser({
    required String username,
    required String fullName,
    required String password,
    required UserRole role,
  }) async {
    final salt = PasswordHasher.generateSalt();
    final user = UserModel()
      ..id = users.length + 1
      ..username = username
      ..fullName = fullName
      ..passwordSalt = salt
      ..passwordHash = PasswordHasher.hash(password, salt)
      ..role = role;
    users.add(user);
    return user;
  }

  @override
  Future<UserModel> updateUser(UserModel user) async => user;

  @override
  Future<void> changePassword(Id userId, String newPassword) async {}

  @override
  Future<bool> deleteUser(Id id) async => true;

  @override
  Future<bool> existsByUsername(String username, {Id? excludeId}) async {
    return users.any(
      (user) => user.username == username && user.id != excludeId,
    );
  }

  @override
  Future<int> countActiveAdmins({Id? excludeId}) async {
    return users
        .where(
          (user) =>
              user.role == UserRole.admin &&
              user.isActive &&
              user.id != excludeId,
        )
        .length;
  }
}

void main() {
  testWidgets('يعرض شاشة تسجيل الدخول عند عدم تسجيل الدخول', (tester) async {
    final fakeAuthService = _FakeAuthService([]);
    await fakeAuthService.ensureDefaultAdmin();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [authServiceProvider.overrideWithValue(fakeAuthService)],
        child: const EmployeeSystemApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('تسجيل الدخول للمتابعة إلى النظام'), findsOneWidget);
  });

  testWidgets('تسجيل الدخول بالحساب الافتراضي الصحيح ينقل للوحة التحكم', (
    tester,
  ) async {
    final fakeAuthService = _FakeAuthService([]);
    await fakeAuthService.ensureDefaultAdmin();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [authServiceProvider.overrideWithValue(fakeAuthService)],
        child: const EmployeeSystemApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'اسم المستخدم'),
      DefaultAdminCredentials.username,
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'كلمة المرور'),
      DefaultAdminCredentials.password,
    );
    await tester.tap(find.widgetWithText(FilledButton, 'تسجيل الدخول'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('لوحة التحكم'), findsAtLeastNWidgets(1));
  });

  testWidgets('كلمة مرور خاطئة تعرض رسالة خطأ وتبقي المستخدم في شاشة الدخول', (
    tester,
  ) async {
    final fakeAuthService = _FakeAuthService([]);
    await fakeAuthService.ensureDefaultAdmin();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [authServiceProvider.overrideWithValue(fakeAuthService)],
        child: const EmployeeSystemApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'اسم المستخدم'),
      DefaultAdminCredentials.username,
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'كلمة المرور'),
      'wrong-password',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'تسجيل الدخول'));
    await tester.pumpAndSettle();

    expect(find.text('اسم المستخدم أو كلمة المرور غير صحيحة'), findsOneWidget);
    expect(find.text('تسجيل الدخول للمتابعة إلى النظام'), findsOneWidget);
  });
}
