import 'package:isar/isar.dart';

import '../../../../core/database/app_database.dart';
import '../models/organization_info_model.dart';

abstract class OrganizationInfoService {
  const OrganizationInfoService();

  Future<OrganizationInfoModel?> getOrganizationInfo();

  Stream<OrganizationInfoModel?> watchOrganizationInfo();

  Future<OrganizationInfoModel> saveOrganizationInfo(
    OrganizationInfoModel info,
  );

  Future<bool> deleteOrganizationInfo();
}

class IsarOrganizationInfoService implements OrganizationInfoService {
  const IsarOrganizationInfoService();

  static const String _primaryRecordKey = 'primary';

  @override
  Future<OrganizationInfoModel?> getOrganizationInfo() async {
    final isar = await AppDatabase.open();
    return _primaryRecordQuery(isar).findFirst();
  }

  @override
  Stream<OrganizationInfoModel?> watchOrganizationInfo() async* {
    final isar = await AppDatabase.open();

    yield* _primaryRecordQuery(isar)
        .watch(fireImmediately: true)
        .map((records) => records.isEmpty ? null : records.first);
  }

  @override
  Future<OrganizationInfoModel> saveOrganizationInfo(
    OrganizationInfoModel info,
  ) async {
    final isar = await AppDatabase.open();
    final existingInfo = await _primaryRecordQuery(isar).findFirst();
    final now = DateTime.now();

    info.recordKey = _primaryRecordKey;
    info.updatedAt = now;

    if (existingInfo != null) {
      info.id = existingInfo.id;
      info.createdAt = existingInfo.createdAt;
    } else {
      info.createdAt = now;
    }

    await isar.writeTxn(() async {
      await isar.organizationInfoModels.put(info);
    });

    return info;
  }

  @override
  Future<bool> deleteOrganizationInfo() async {
    final isar = await AppDatabase.open();
    final existingInfo = await _primaryRecordQuery(isar).findFirst();

    if (existingInfo == null) {
      return false;
    }

    return isar.writeTxn(() async {
      return isar.organizationInfoModels.delete(existingInfo.id);
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  _primaryRecordQuery(Isar isar) {
    return isar.organizationInfoModels.filter().recordKeyEqualTo(
      _primaryRecordKey,
    );
  }
}
