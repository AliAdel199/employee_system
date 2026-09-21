import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();

  static const String login = '/login';
  static const String dashboard = '/';
  static const String employees = '/employees';
  static const String employeeCreate = '/employees/create';
  static const String employeeEditPattern = '/employees/:employeeId/edit';
  static const String organization = '/organization';
  static const String reports = '/reports';
  static const String users = '/users';
  static const String backup = '/backup';

  static String employeeEdit(int employeeId) => '/employees/$employeeId/edit';
}

class AppNavigationItem {
  const AppNavigationItem({
    required this.title,
    required this.subtitle,
    required this.path,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String path;
  final IconData icon;
}

const appNavigationItems = [
  AppNavigationItem(
    title: 'لوحة التحكم',
    subtitle: 'الإحصاءات، آخر الموظفين، والاختصارات السريعة',
    path: AppRoutes.dashboard,
    icon: Icons.space_dashboard_rounded,
  ),
  AppNavigationItem(
    title: 'إدارة الموظفين',
    subtitle: 'عرض، بحث، إضافة، تعديل، وحذف الموظفين',
    path: AppRoutes.employees,
    icon: Icons.badge_rounded,
  ),
  AppNavigationItem(
    title: 'معلومات المؤسسة',
    subtitle: 'بيانات الجهة الرسمية المستخدمة داخل النظام',
    path: AppRoutes.organization,
    icon: Icons.account_balance_rounded,
  ),
  AppNavigationItem(
    title: 'التقارير',
    subtitle: 'التقارير والطباعة والتصدير',
    path: AppRoutes.reports,
    icon: Icons.assessment_rounded,
  ),
  AppNavigationItem(
    title: 'إدارة المستخدمين',
    subtitle: 'إنشاء حسابات الدخول وتحديد الصلاحيات',
    path: AppRoutes.users,
    icon: Icons.manage_accounts_rounded,
  ),
  AppNavigationItem(
    title: 'النسخ الاحتياطي والبيانات',
    subtitle: 'نسخ احتياطي، واستيراد وتصدير بيانات الموظفين',
    path: AppRoutes.backup,
    icon: Icons.cloud_sync_outlined,
  ),
];
