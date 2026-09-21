import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth.dart';
import '../../features/backup/backup.dart';
import '../../features/dashboard/dashboard.dart';
import '../../features/employees/employees.dart';
import '../../features/organization/organization.dart';
import '../../features/reports/reports.dart';
import '../../shared/presentation/layouts/app_shell.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = ref.watch(_routerRefreshNotifierProvider);

  return GoRouter(
    initialLocation: AppRoutes.dashboard,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final location = state.matchedLocation;
      final isLoginRoute = location == AppRoutes.login;

      final currentUser = ref.read(currentUserProvider);
      final isLoggedIn = currentUser != null;

      if (!isLoggedIn) {
        return isLoginRoute ? null : AppRoutes.login;
      }

      if (isLoginRoute) {
        return AppRoutes.dashboard;
      }

      final isAdminOnlyRoute =
          location == AppRoutes.users || location == AppRoutes.backup;
      if (isAdminOnlyRoute && currentUser.role != UserRole.admin) {
        return AppRoutes.dashboard;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(currentLocation: state.uri.path, child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.dashboard,
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: AppRoutes.employees,
            builder: (context, state) => const EmployeesPage(),
            routes: [
              GoRoute(
                path: 'create',
                builder: (context, state) => const EmployeeFormPage(),
              ),
              GoRoute(
                path: ':employeeId/edit',
                builder: (context, state) {
                  final employeeId = int.tryParse(
                    state.pathParameters['employeeId'] ?? '',
                  );

                  if (employeeId == null) {
                    return const _EmployeeRouteErrorPage();
                  }

                  return EmployeeFormPage(employeeId: employeeId);
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.organization,
            builder: (context, state) => const OrganizationPage(),
          ),
          GoRoute(
            path: AppRoutes.reports,
            builder: (context, state) => const ReportsPage(),
          ),
          GoRoute(
            path: AppRoutes.users,
            builder: (context, state) => const UsersManagementPage(),
          ),
          GoRoute(
            path: AppRoutes.backup,
            builder: (context, state) => const BackupPage(),
          ),
        ],
      ),
    ],
  );
});

final _routerRefreshNotifierProvider = Provider<_RouterRefreshNotifier>((ref) {
  final notifier = _RouterRefreshNotifier();
  ref.listen(currentUserProvider, (_, __) => notifier.notify());
  ref.onDispose(notifier.dispose);
  return notifier;
});

class _RouterRefreshNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}

class _EmployeeRouteErrorPage extends StatelessWidget {
  const _EmployeeRouteErrorPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('معرّف الموظف غير صالح')));
  }
}
