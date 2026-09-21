import 'dart:io';

import '../../../../core/database/app_database.dart';

abstract class BackupService {
  const BackupService();

  /// ينشئ نسخة احتياطية كاملة لقاعدة بيانات هذا الجهاز (الموظفين، بيانات
  /// المؤسسة، والمستخدمين) في الملف المحدد. لا تشمل النسخة ملفات الصور
  /// المرفقة، لأنها محفوظة كملفات خارجية على الجهاز.
  Future<void> createBackup(String targetFilePath);

  /// يستبدل قاعدة بيانات هذا الجهاز بالكامل بمحتوى ملف النسخة الاحتياطية
  /// المحدد. يتطلب إعادة تشغيل التطبيق بعد الانتهاء لتطبيق التغييرات.
  Future<void> restoreBackup(String sourceFilePath);
}

class IsarBackupService implements BackupService {
  const IsarBackupService();

  @override
  Future<void> createBackup(String targetFilePath) async {
    final isar = await AppDatabase.open();
    await isar.copyToFile(targetFilePath);
  }

  @override
  Future<void> restoreBackup(String sourceFilePath) async {
    final sourceFile = File(sourceFilePath);
    if (!await sourceFile.exists()) {
      throw StateError('ملف النسخة الاحتياطية غير موجود.');
    }

    final isar = await AppDatabase.open();
    final livePath = isar.path;
    if (livePath == null) {
      throw StateError('تعذر تحديد مسار قاعدة البيانات الحالية.');
    }

    // نسخة أمان من قاعدة البيانات الحالية قبل الاستبدال، تحسباً لاختيار ملف
    // استعادة غير مقصود.
    final safetyPath =
        '$livePath.before-restore-${DateTime.now().millisecondsSinceEpoch}.bak';
    await isar.copyToFile(safetyPath);

    await AppDatabase.close();
    // مهلة قصيرة لضمان تحرير نظام التشغيل لقفل الملف بعد الإغلاق.
    await Future<void>.delayed(const Duration(milliseconds: 200));

    await sourceFile.copy(livePath);
  }
}
