import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/app_section_card.dart';
import '../../../employees/employees.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statisticsAsync = ref.watch(employeeStatisticsProvider);
    final recentEmployeesAsync = ref.watch(recentEmployeesProvider);
    final theme = Theme.of(context);

    return Container(
      color: AppColors.background,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Color(0xFF173E6C), Color(0xFF2F5D91)],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Text(
                    AppConstants.currentStage,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'لوحة متابعة سريعة لإدارة بيانات الموظفين',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  AppConstants.currentStageDescription,
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.7,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          statisticsAsync.when(
            data: (statistics) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 700 ? 3 : 1;
                  const spacing = 16.0;
                  final cardWidth =
                      (constraints.maxWidth - ((columns - 1) * spacing)) /
                      columns;

                  final cards = [
                    _DashboardStatCard(
                      title: 'عدد الموظفين',
                      value: statistics.totalCount.toString(),
                      icon: Icons.groups_2_rounded,
                    ),
                    _DashboardStatCard(
                      title: 'عدد الذكور',
                      value: statistics.maleCount.toString(),
                      icon: Icons.male_rounded,
                    ),
                    _DashboardStatCard(
                      title: 'عدد الإناث',
                      value: statistics.femaleCount.toString(),
                      icon: Icons.female_rounded,
                    ),
                  ];

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: cards
                        .map((card) => SizedBox(width: cardWidth, child: card))
                        .toList(),
                  );
                },
              );
            },
            loading: () => const _DashboardLoadingCards(),
            error: (_, __) => const _DashboardErrorCard(),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final showTwoColumns = constraints.maxWidth >= 1100;

              if (!showTwoColumns) {
                return Column(
                  children: [
                    _QuickActionsSection(
                      onEmployeesTap: () => context.go(AppRoutes.employees),
                      onOrganizationTap: () =>
                          context.go(AppRoutes.organization),
                      onReportsTap: () => context.go(AppRoutes.reports),
                    ),
                    const SizedBox(height: 16),
                    _RecentEmployeesSection(
                      recentEmployeesAsync: recentEmployeesAsync,
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _RecentEmployeesSection(
                      recentEmployeesAsync: recentEmployeesAsync,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _QuickActionsSection(
                      onEmployeesTap: () => context.go(AppRoutes.employees),
                      onOrganizationTap: () =>
                          context.go(AppRoutes.organization),
                      onReportsTap: () => context.go(AppRoutes.reports),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DashboardStatCard extends StatelessWidget {
  const _DashboardStatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: theme.textTheme.headlineMedium?.copyWith(fontSize: 32),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionsSection extends StatelessWidget {
  const _QuickActionsSection({
    required this.onEmployeesTap,
    required this.onOrganizationTap,
    required this.onReportsTap,
  });

  final VoidCallback onEmployeesTap;
  final VoidCallback onOrganizationTap;
  final VoidCallback onReportsTap;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'أزرار سريعة',
      subtitle: 'اختصارات عملية للوصول إلى أهم أقسام النظام.',
      child: Column(
        children: [
          _QuickActionTile(
            title: 'إدارة الموظفين',
            subtitle: 'الانتقال إلى شاشة جدول الموظفين والعمليات الأساسية.',
            icon: Icons.badge_rounded,
            onTap: onEmployeesTap,
          ),
          const SizedBox(height: 12),
          _QuickActionTile(
            title: 'معلومات المؤسسة',
            subtitle: 'فتح بيانات الجهة الرسمية المستخدمة في التقارير.',
            icon: Icons.account_balance_rounded,
            onTap: onOrganizationTap,
          ),
          const SizedBox(height: 12),
          _QuickActionTile(
            title: 'التقارير',
            subtitle: 'مراجعة تقارير الموظفين وخيارات الطباعة والتصدير.',
            icon: Icons.assessment_rounded,
            onTap: onReportsTap,
          ),
        ],
      ),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  const _QuickActionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: AppColors.primary),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 6),
                    Text(subtitle, style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecentEmployeesSection extends StatelessWidget {
  const _RecentEmployeesSection({required this.recentEmployeesAsync});

  final AsyncValue<List<EmployeeModel>> recentEmployeesAsync;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'آخر الموظفين المضافين',
      subtitle: 'عرض سريع لأحدث السجلات الموجودة في النظام.',
      action: TextButton(
        onPressed: () => context.go(AppRoutes.employees),
        child: const Text('عرض الكل'),
      ),
      child: recentEmployeesAsync.when(
        data: (employees) {
          if (employees.isEmpty) {
            return const _EmptyStateMessage(
              title: 'لا توجد بيانات موظفين بعد',
              subtitle: 'ستظهر هنا أحدث السجلات فور إضافة أول موظف إلى النظام.',
            );
          }

          return Column(
            children: employees
                .map(
                  (employee) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _RecentEmployeeTile(employee: employee),
                  ),
                )
                .toList(),
          );
        },
        loading: () => const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (_, __) => const _EmptyStateMessage(
          title: 'تعذر تحميل آخر الموظفين',
          subtitle: 'يمكن إعادة المحاولة بعد التحقق من حالة قاعدة البيانات.',
        ),
      ),
    );
  }
}

class _RecentEmployeeTile extends StatelessWidget {
  const _RecentEmployeeTile({required this.employee});

  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.primary.withValues(alpha: 0.12),
            child: const Icon(Icons.person_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.fullName.isEmpty ? 'بدون اسم' : employee.fullName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  employee.jobTitle.isEmpty
                      ? 'العنوان الوظيفي غير محدد'
                      : employee.jobTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              employee.employeeNumber.isEmpty
                  ? 'بدون رقم وظيفي'
                  : employee.employeeNumber,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardLoadingCards extends StatelessWidget {
  const _DashboardLoadingCards();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: _LoadingPlaceholderCard()),
        SizedBox(width: 16),
        Expanded(child: _LoadingPlaceholderCard()),
        SizedBox(width: 16),
        Expanded(child: _LoadingPlaceholderCard()),
      ],
    );
  }
}

class _LoadingPlaceholderCard extends StatelessWidget {
  const _LoadingPlaceholderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class _DashboardErrorCard extends StatelessWidget {
  const _DashboardErrorCard();

  @override
  Widget build(BuildContext context) {
    return const AppSectionCard(
      title: 'تعذر تحميل الإحصاءات',
      subtitle: 'يمكن متابعة العمل، وسيتم تحديث البيانات بعد عودة القراءة.',
      child: _EmptyStateMessage(
        title: 'حدثت مشكلة أثناء قراءة بيانات الموظفين',
        subtitle: 'تحقق من قاعدة البيانات ثم أعد المحاولة.',
      ),
    );
  }
}

class _EmptyStateMessage extends StatelessWidget {
  const _EmptyStateMessage({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
