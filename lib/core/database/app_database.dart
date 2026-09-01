import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

import 'database_config.dart';
import 'database_paths.dart';
import 'database_schema_registry.dart';

class AppDatabase {
  const AppDatabase._();

  static Future<void> initialize() async {
    await DatabasePaths.ensureDatabaseDirectory();
  }

  static Isar? get instance => Isar.getInstance(DatabaseConfig.instanceName);

  static Future<Isar> open() async {
    final existingInstance = instance;
    if (existingInstance != null && existingInstance.isOpen) {
      return existingInstance;
    }

    final schemas = DatabaseSchemaRegistry.all;
    if (schemas.isEmpty) {
      throw StateError(
        'لا يمكن فتح قاعدة البيانات قبل تسجيل Schemas. '
        'سنضيفها في خطوة إنشاء الموديلات.',
      );
    }

    final databaseDirectory = await DatabasePaths.ensureDatabaseDirectory();

    return Isar.open(
      schemas,
      directory: databaseDirectory.path,
      name: DatabaseConfig.instanceName,
      maxSizeMiB: DatabaseConfig.maxSizeMiB,
      relaxedDurability: DatabaseConfig.relaxedDurability,
      compactOnLaunch: const CompactCondition(
        minFileSize: DatabaseConfig.compactMinFileSizeBytes,
        minBytes: DatabaseConfig.compactMinUnusedBytes,
        minRatio: DatabaseConfig.compactMinRatio,
      ),
      inspector: kDebugMode,
    );
  }

  static Future<void> close() async {
    final existingInstance = instance;
    if (existingInstance == null || !existingInstance.isOpen) {
      return;
    }

    await existingInstance.close();
  }
}
