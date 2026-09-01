import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/organization_info_model.dart';
import '../../data/services/organization_info_service.dart';

final organizationInfoServiceProvider = Provider<OrganizationInfoService>((
  ref,
) {
  return const IsarOrganizationInfoService();
});

final organizationInfoProvider =
    StreamProvider.autoDispose<OrganizationInfoModel?>((ref) {
      final service = ref.watch(organizationInfoServiceProvider);
      return service.watchOrganizationInfo();
    });

final organizationInfoMutationControllerProvider =
    AutoDisposeAsyncNotifierProvider<OrganizationInfoMutationController, void>(
      OrganizationInfoMutationController.new,
    );

class OrganizationInfoMutationController
    extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<OrganizationInfoModel> saveOrganizationInfo(
    OrganizationInfoModel info,
  ) async {
    final service = ref.read(organizationInfoServiceProvider);

    state = const AsyncLoading();
    final result = await AsyncValue.guard(
      () => service.saveOrganizationInfo(info),
    );
    state = result.whenData((_) {});

    return result.requireValue;
  }

  Future<bool> deleteOrganizationInfo() async {
    final service = ref.read(organizationInfoServiceProvider);

    state = const AsyncLoading();
    final result = await AsyncValue.guard(service.deleteOrganizationInfo);
    state = result.whenData((_) {});

    return result.valueOrNull ?? false;
  }
}
