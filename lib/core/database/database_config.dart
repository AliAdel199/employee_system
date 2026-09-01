class DatabaseConfig {
  const DatabaseConfig._();

  static const String instanceName = 'employee_system';
  static const String directoryName = 'database';

  static const int maxSizeMiB = 512;
  static const bool relaxedDurability = true;

  static const int compactMinFileSizeBytes = 32 * 1024 * 1024;
  static const int compactMinUnusedBytes = 8 * 1024 * 1024;
  static const double compactMinRatio = 1.5;
}
