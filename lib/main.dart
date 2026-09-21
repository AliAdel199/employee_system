import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';

import 'app.dart';
import 'core/database/app_database.dart';
import 'features/auth/data/services/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.initialize();
  await const IsarAuthService().ensureDefaultAdmin();
  runApp(const ProviderScope(child: EmployeeSystemApp()));
}
