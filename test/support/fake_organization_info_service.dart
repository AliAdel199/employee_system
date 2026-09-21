import 'dart:async';

import 'package:employee_system/features/organization/organization.dart';

class FakeOrganizationInfoService implements OrganizationInfoService {
  FakeOrganizationInfoService([OrganizationInfoModel? initial])
    : _info = initial;

  OrganizationInfoModel? _info;
  final _controller = StreamController<OrganizationInfoModel?>.broadcast();

  @override
  Future<OrganizationInfoModel?> getOrganizationInfo() async => _info;

  @override
  Stream<OrganizationInfoModel?> watchOrganizationInfo() async* {
    yield _info;
    yield* _controller.stream;
  }

  @override
  Future<OrganizationInfoModel> saveOrganizationInfo(
    OrganizationInfoModel info,
  ) async {
    info.id = _info?.id ?? 1;
    _info = info;
    _controller.add(_info);
    return info;
  }

  @override
  Future<bool> deleteOrganizationInfo() async {
    final had = _info != null;
    _info = null;
    _controller.add(null);
    return had;
  }
}
