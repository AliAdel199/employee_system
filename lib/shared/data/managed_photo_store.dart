import 'dart:io';

import 'package:path/path.dart' as p;

import '../../core/database/database_paths.dart';

/// يتحكم بتخزين ملفات الصور (صور الموظفين وشعار المؤسسة) داخل مجلد يديره
/// التطبيق نفسه، بدل الاكتفاء بحفظ مسار الملف الأصلي الذي اختاره المستخدم.
///
/// السبب: لو بقي السجل يشير فقط إلى مسار الملف الأصلي (مثلاً من سطح المكتب
/// أو USB)، فإن نقل أو حذف أو إعادة تسمية ذلك الملف من خارج البرنامج يكسر
/// الصورة داخل النظام. نسخ الملف إلى مجلد التطبيق عند الاختيار يجعل الصورة
/// معتمدة فقط على النظام نفسه.
class ManagedPhotoStore {
  const ManagedPhotoStore._();

  /// ينسخ ملف الصورة المُختار إلى مجلد صور التطبيق ويعيد المسار المحلي
  /// الجديد.
  static Future<String> importFile(String sourceFilePath) async {
    final sourceFile = File(sourceFilePath);
    final extension = p.extension(sourceFilePath);
    final photosDirectory = await DatabasePaths.ensurePhotosDirectory();
    final fileName = '${DateTime.now().microsecondsSinceEpoch}$extension';
    final targetFile = File(p.join(photosDirectory.path, fileName));

    await sourceFile.copy(targetFile.path);
    return targetFile.path;
  }

  /// يحذف صورة كانت مُدارة سابقاً من قِبل التطبيق، ويتجاهل بأمان أي مسار
  /// فارغ أو خارج مجلد صور التطبيق أو غير موجود أصلاً.
  static Future<void> deleteIfManaged(String? photoPath) async {
    final normalizedPath = (photoPath ?? '').trim();
    if (normalizedPath.isEmpty) {
      return;
    }

    final photosDirectory = await DatabasePaths.ensurePhotosDirectory();
    final normalizedPhotoPath = p.normalize(normalizedPath);
    final normalizedPhotosDir = p.normalize(photosDirectory.path);

    if (!p.isWithin(normalizedPhotosDir, normalizedPhotoPath)) {
      return;
    }

    final file = File(normalizedPhotoPath);
    if (await file.exists()) {
      await file.delete();
    }
  }
}
