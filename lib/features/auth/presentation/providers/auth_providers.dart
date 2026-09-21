import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../data/models/user_model.dart';
import '../../data/services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return const IsarAuthService();
});

final usersListProvider = StreamProvider.autoDispose<List<UserModel>>((ref) {
  final service = ref.watch(authServiceProvider);
  return service.watchUsers();
});

final currentUserProvider = NotifierProvider<CurrentUserController, UserModel?>(
  CurrentUserController.new,
);

class CurrentUserController extends Notifier<UserModel?> {
  @override
  UserModel? build() => null;

  void setUser(UserModel? user) {
    state = user;
  }

  void logout() {
    state = null;
  }
}

final loginControllerProvider =
    AutoDisposeAsyncNotifierProvider<LoginController, void>(
      LoginController.new,
    );

class LoginController extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<bool> login(String username, String password) async {
    state = const AsyncLoading();
    final service = ref.read(authServiceProvider);

    try {
      final user = await service.login(username, password);

      if (user == null) {
        state = AsyncError(
          'اسم المستخدم أو كلمة المرور غير صحيحة',
          StackTrace.current,
        );
        return false;
      }

      ref.read(currentUserProvider.notifier).setUser(user);
      state = const AsyncData(null);
      return true;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      return false;
    }
  }
}

final userMutationControllerProvider =
    AutoDisposeAsyncNotifierProvider<UserMutationController, void>(
      UserMutationController.new,
    );

class UserMutationController extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<UserModel> createUser({
    required String username,
    required String fullName,
    required String password,
    required UserRole role,
  }) async {
    final service = ref.read(authServiceProvider);

    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => service.createUser(
        username: username,
        fullName: fullName,
        password: password,
        role: role,
      ),
    );
    state = result.whenData((_) {});

    return result.requireValue;
  }

  Future<void> updateUserInfo(UserModel user) async {
    final service = ref.read(authServiceProvider);

    state = const AsyncLoading();
    final result = await AsyncValue.guard(() => service.updateUser(user));
    state = result.whenData((_) {});
    result.requireValue;
  }

  Future<void> setActive(UserModel user, bool isActive) {
    user.isActive = isActive;
    return updateUserInfo(user);
  }

  Future<void> changePassword(Id userId, String newPassword) async {
    final service = ref.read(authServiceProvider);

    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => service.changePassword(userId, newPassword),
    );
    state = result.whenData((_) {});
  }

  Future<bool> deleteUser(Id id) async {
    final service = ref.read(authServiceProvider);

    state = const AsyncLoading();
    final result = await AsyncValue.guard(() => service.deleteUser(id));
    state = result.whenData((_) {});

    return result.valueOrNull ?? false;
  }
}
