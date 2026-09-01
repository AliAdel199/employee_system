import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/dashboard.dart';
import '../../features/employees/employees.dart';
import '../../features/organization/organization.dart';
import '../../features/reports/reports.dart';
import '../../shared/presentation/layouts/app_shell.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.dashboard,
    routes: [
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
        ],
      ),
    ],
  );
});

class _EmployeeRouteErrorPage extends StatelessWidget {
  const _EmployeeRouteErrorPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('معرّف الموظف غير صالح')));
  }
}
