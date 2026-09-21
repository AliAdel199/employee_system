import 'package:isar/isar.dart';

import '../../../../core/database/app_database.dart';
import '../models/user_model.dart';
import 'password_hasher.dart';

class DefaultAdminCredentials {
  const DefaultAdminCredentials._();

  static const String username = 'admin';
  static const String password = 'admin123';
  static const String fullName = 'المدير العام';
}

abstract class AuthService {
  const AuthService();

  Future<bool> hasAnyUser();

  /// ينشئ حساب المدير الافتراضي عند عدم وجود أي مستخدم على هذا الجهاز،
  /// حتى يتمكن أول من يشغّل النظام من الدخول مباشرة دون معالج إعداد.
  Future<void> ensureDefaultAdmin();

  Future<List<UserModel>> getUsers();

  Stream<List<UserModel>> watchUsers();

  Future<UserModel?> getUserById(Id id);

  Future<UserModel?> login(String username, String password);

  Future<UserModel> createUser({
    required String username,
    required String fullName,
    required String password,
    required UserRole role,
  });

  Future<UserModel> updateUser(UserModel user);

  Future<void> changePassword(Id userId, String newPassword);

  Future<bool> deleteUser(Id id);

  Future<bool> existsByUsername(String username, {Id? excludeId});

  Future<int> countActiveAdmins({Id? excludeId});
}

class IsarAuthService implements AuthService {
  const IsarAuthService();

  @override
  Future<bool> hasAnyUser() async {
    final isar = await AppDatabase.open();
    final count = await isar.userModels.where().count();
    return count > 0;
  }

  @override
  Future<void> ensureDefaultAdmin() async {
    if (await hasAnyUser()) {
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
  Future<List<UserModel>> getUsers() async {
    final isar = await AppDatabase.open();
    return isar.userModels.where().sortByFullName().findAll();
  }

  @override
  Stream<List<UserModel>> watchUsers() async* {
    final isar = await AppDatabase.open();
    yield* isar.userModels
        .where()
        .sortByFullName()
        .watch(fireImmediately: true);
  }

  @override
  Future<UserModel?> getUserById(Id id) async {
    final isar = await AppDatabase.open();
    return isar.userModels.get(id);
  }

  @override
  Future<UserModel?> login(String username, String password) async {
    final normalizedUsername = username.trim();
    if (normalizedUsername.isEmpty || password.isEmpty) {
      return null;
    }

    final isar = await AppDatabase.open();
    final user = await isar.userModels
        .filter()
        .usernameEqualTo(normalizedUsername, caseSensitive: false)
        .findFirst();

    if (user == null || !user.isActive) {
      return null;
    }

    final isValid = PasswordHasher.verify(
      password,
      user.passwordSalt,
      user.passwordHash,
    );

    if (!isValid) {
      return null;
    }

    user.lastLoginAt = DateTime.now();
    await isar.writeTxn(() => isar.userModels.put(user));

    return user;
  }

  @override
  Future<UserModel> createUser({
    required String username,
    required String fullName,
    required String password,
    required UserRole role,
  }) async {
    final isar = await AppDatabase.open();
    final salt = PasswordHasher.generateSalt();
    final now = DateTime.now();

    final user = UserModel()
      ..username = username.trim()
      ..fullName = fullName.trim()
      ..passwordSalt = salt
      ..passwordHash = PasswordHasher.hash(password, salt)
      ..role = role
      ..isActive = true
      ..createdAt = now
      ..updatedAt = now;

    await isar.writeTxn(() => isar.userModels.put(user));

    return user;
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    final isar = await AppDatabase.open();
    user.updatedAt = DateTime.now();

    await isar.writeTxn(() => isar.userModels.put(user));

    return user;
  }

  @override
  Future<void> changePassword(Id userId, String newPassword) async {
    final isar = await AppDatabase.open();
    final user = await isar.userModels.get(userId);

    if (user == null) {
      return;
    }

    final salt = PasswordHasher.generateSalt();
    user
      ..passwordSalt = salt
      ..passwordHash = PasswordHasher.hash(newPassword, salt)
      ..updatedAt = DateTime.now();

    await isar.writeTxn(() => isar.userModels.put(user));
  }

  @override
  Future<bool> deleteUser(Id id) async {
    final isar = await AppDatabase.open();
    return isar.writeTxn(() => isar.userModels.delete(id));
  }

  @override
  Future<bool> existsByUsername(String username, {Id? excludeId}) async {
    final normalizedValue = username.trim();
    if (normalizedValue.isEmpty) {
      return false;
    }

    final isar = await AppDatabase.open();
    final matches = await isar.userModels
        .filter()
        .usernameEqualTo(normalizedValue, caseSensitive: false)
        .findAll();

    return matches.any((user) => user.id != excludeId);
  }

  @override
  Future<int> countActiveAdmins({Id? excludeId}) async {
    final isar = await AppDatabase.open();
    final admins = await isar.userModels
        .filter()
        .roleEqualTo(UserRole.admin)
        .isActiveEqualTo(true)
        .findAll();

    return admins.where((user) => user.id != excludeId).length;
  }
}
