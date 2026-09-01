import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/module_overview_card.dart';

class ProjectSetupPage extends StatelessWidget {
  const ProjectSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7FAFD), AppColors.background],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.border),
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
                      color: AppColors.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text(
                      AppConstants.currentStage,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'أساس مرن لبناء نظام مكتبي حكومي حديث',
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppConstants.currentStageDescription,
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 1200
                    ? 4
                    : constraints.maxWidth >= 800
                    ? 2
                    : 1;
                const spacing = 16.0;
                final cardWidth =
                    (constraints.maxWidth - ((columns - 1) * spacing)) /
                    columns;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children:
                      const [
                        _ModuleCardData(
                          title: 'لوحة التحكم',
                          description:
                              'مكان مخصص للإحصائيات السريعة، آخر الموظفين، والاختصارات العملية.',
                          icon: Icons.dashboard_outlined,
                        ),
                        _ModuleCardData(
                          title: 'إدارة الموظفين',
                          description:
                              'هيكل مستقل لعرض الجدول، البحث، الإضافة، التعديل، والحذف بدون تداخل مع بقية الشاشات.',
                          icon: Icons.badge_outlined,
                        ),
                        _ModuleCardData(
                          title: 'معلومات المؤسسة',
                          description:
                              'قسم مركزي لتخزين بيانات الجهة الرسمية واستعمالها لاحقاً في التقارير والطباعة.',
                          icon: Icons.apartment_outlined,
                        ),
                        _ModuleCardData(
                          title: 'التقارير والتصدير',
                          description:
                              'مساحة جاهزة لإضافة إنشاء PDF وExcel والطباعة بطريقة قابلة للتوسع.',
                          icon: Icons.assessment_outlined,
                        ),
                      ].map((module) {
                        return SizedBox(
                          width: cardWidth,
                          child: ModuleOverviewCard(
                            title: module.title,
                            description: module.description,
                            icon: module.icon,
                          ),
                        );
                      }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ModuleCardData {
  const _ModuleCardData({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}
