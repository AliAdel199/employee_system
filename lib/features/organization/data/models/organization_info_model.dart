import 'package:isar/isar.dart';

part 'organization_info_model.g.dart';

@collection
class OrganizationInfoModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true, type: IndexType.value)
  String recordKey = 'primary';

  String ministryName = '';
  String organizationName = '';
  String branchName = '';
  String departmentName = '';
  String logoPath = '';
  String address = '';
  String phoneNumber = '';
  String email = '';
  String reportsFooter = '';

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
