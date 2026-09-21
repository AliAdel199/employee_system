import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'database_config.dart';

class DatabasePaths {
  const DatabasePaths._();

  static Future<Directory> ensureDatabaseDirectory() async {
    final supportDirectory = await getApplicationSupportDirectory();
    final databaseDirectory = Directory(
      path.join(supportDirectory.path, DatabaseConfig.directoryName),
    );

    if (!await databaseDirectory.exists()) {
      await databaseDirectory.create(recursive: true);
    }

    return databaseDirectory;
  }

  static Future<Directory> ensurePhotosDirectory() async {
    final supportDirectory = await getApplicationSupportDirectory();
    final photosDirectory = Directory(
      path.join(supportDirectory.path, 'photos'),
    );

    if (!await photosDirectory.exists()) {
      await photosDirectory.create(recursive: true);
    }

    return photosDirectory;
  }
}
