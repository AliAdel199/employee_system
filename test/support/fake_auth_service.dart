import 'package:employee_system/features/auth/auth.dart';
import 'package:employee_system/features/auth/data/services/password_hasher.dart';
import 'package:isar/isar.dart';

class FakeAuthService implements AuthService {
  FakeAuthService([List<UserModel>? initialUsers])
    : users = initialUsers ?? [];

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
  Future<UserModel> updateUser(UserModel user) async {
    final index = users.indexWhere((u) => u.id == user.id);
    if (index >= 0) {
      users[index] = user;
    }
    return user;
  }

  @override
  Future<void> changePassword(Id userId, String newPassword) async {
    final user = await getUserById(userId);
    if (user == null) {
      return;
    }
    final salt = PasswordHasher.generateSalt();
    user
      ..passwordSalt = salt
      ..passwordHash = PasswordHasher.hash(newPassword, salt);
  }

  @override
  Future<bool> deleteUser(Id id) async {
    final before = users.length;
    users.removeWhere((user) => user.id == id);
    return users.length != before;
  }

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
