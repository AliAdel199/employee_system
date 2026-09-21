import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/backup_service.dart';
import '../../data/services/employee_transfer_service.dart';

final backupServiceProvider = Provider<BackupService>((ref) {
  return const IsarBackupService();
});

final employeeTransferServiceProvider = Provider<EmployeeTransferService>((
  ref,
) {
  return const EmployeeTransferService();
});
