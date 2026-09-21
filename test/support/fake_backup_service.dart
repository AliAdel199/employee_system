import 'package:employee_system/features/backup/backup.dart';

class FakeBackupService implements BackupService {
  String? lastBackupPath;
  String? lastRestorePath;

  @override
  Future<void> createBackup(String targetFilePath) async {
    lastBackupPath = targetFilePath;
  }

  @override
  Future<void> restoreBackup(String sourceFilePath) async {
    lastRestorePath = sourceFilePath;
  }
}
