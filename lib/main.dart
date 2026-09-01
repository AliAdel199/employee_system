import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';

import 'app.dart';
import 'core/database/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.initialize();
  runApp(const ProviderScope(child: EmployeeSystemApp()));
}
