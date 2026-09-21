import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false, type: IndexType.value)
  String username = '';

  String fullName = '';

  String passwordHash = '';
  String passwordSalt = '';

  @Enumerated(EnumType.name)
  UserRole role = UserRole.user;

  @Index()
  bool isActive = true;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  DateTime? lastLoginAt;
}

enum UserRole { admin, user }

extension UserRoleX on UserRole {
  String get label {
    switch (this) {
      case UserRole.admin:
        return 'مدير';
      case UserRole.user:
        return 'مستخدم';
    }
  }
}
