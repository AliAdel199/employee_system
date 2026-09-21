import 'dart:io';

import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';
import 'package:path/path.dart' as p;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// يستبدل نوافذ اختيار/حفظ الملفات الأصلية لنظام التشغيل (التي لا يمكن
/// أتمتتها في أي بيئة اختبار) بسلوك محدد مسبقاً، بينما تبقى كل العمليات
/// الأخرى (قراءة/كتابة الملفات، قاعدة البيانات) حقيقية بالكامل.
class FakeFileSelectorPlatform extends FileSelectorPlatform
    with MockPlatformInterfaceMixin {
  FakeFileSelectorPlatform({required this.workDirectory});

  final Directory workDirectory;

  /// المسار الذي سيُعاد عند استدعاء openFile القادم (يحاكي اختيار المستخدم
  /// لهذا الملف من نافذة الفتح).
  String? nextOpenFilePath;

  @override
  Future<XFile?> openFile({
    List<XTypeGroup>? acceptedTypeGroups,
    String? initialDirectory,
    String? confirmButtonText,
  }) async {
    final path = nextOpenFilePath;
    return path == null ? null : XFile(path);
  }

  @override
  Future<FileSaveLocation?> getSaveLocation({
    List<XTypeGroup>? acceptedTypeGroups,
    SaveDialogOptions options = const SaveDialogOptions(),
  }) async {
    final suggestedName = options.suggestedName ?? 'output.dat';
    return FileSaveLocation(p.join(workDirectory.path, suggestedName));
  }
}
