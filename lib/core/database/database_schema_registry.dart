import 'package:isar/isar.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/employees/data/models/employee_model.dart';
import '../../features/organization/data/models/organization_info_model.dart';

class DatabaseSchemaRegistry {
  const DatabaseSchemaRegistry._();

  static List<CollectionSchema<dynamic>> get all => [
    EmployeeModelSchema,
    OrganizationInfoModelSchema,
    UserModelSchema,
  ];

  static bool get hasSchemas => all.isNotEmpty;
}
