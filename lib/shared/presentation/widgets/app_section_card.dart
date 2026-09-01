import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AppSectionCard extends StatelessWidget {
  const AppSectionCard({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.action,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final Widget? action;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium),
                    if (subtitle != null) ...[
                      const SizedBox(height: 6),
                      Text(subtitle!, style: theme.textTheme.bodyMedium),
                    ],
                  ],
                ),
              ),
              if (action != null) action!,
            ],
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}
