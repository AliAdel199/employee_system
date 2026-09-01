import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.currentLocation,
    required this.child,
  });

  final String currentLocation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedItem = _selectedItem;
    final isCompact = MediaQuery.sizeOf(context).width < 1100;

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: isCompact
          ? Drawer(
              child: SafeArea(
                child: _SidebarContent(
                  currentLocation: currentLocation,
                  onDestinationSelected: (path) {
                    Navigator.of(context).pop();
                    context.go(path);
                  },
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (!isCompact)
              Padding(
                padding: const EdgeInsets.all(18),
                child: SizedBox(
                  width: 300,
                  child: _SidebarContent(
                    currentLocation: currentLocation,
                    onDestinationSelected: context.go,
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(isCompact ? 12 : 0, 18, 18, 18),
                child: Column(
                  children: [
                    _ShellHeader(
                      title: selectedItem.title,
                      subtitle: selectedItem.subtitle,
                      showMenuButton: isCompact,
                    ),
                    const SizedBox(height: 18),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: child,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppNavigationItem get _selectedItem {
    return appNavigationItems.firstWhere((item) {
      if (item.path == AppRoutes.dashboard) {
        return currentLocation == AppRoutes.dashboard;
      }

      return currentLocation.startsWith(item.path);
    }, orElse: () => appNavigationItems.first);
  }
}

class _ShellHeader extends StatelessWidget {
  const _ShellHeader({
    required this.title,
    required this.subtitle,
    required this.showMenuButton,
  });

  final String title;
  final String subtitle;
  final bool showMenuButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          if (showMenuButton)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu_rounded),
                tooltip: 'القائمة الرئيسية',
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(subtitle, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.desktop_windows_rounded,
                  color: AppColors.primary,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  'نسخة سطح المكتب',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarContent extends StatelessWidget {
  const _SidebarContent({
    required this.currentLocation,
    required this.onDestinationSelected,
  });

  final String currentLocation;
  final ValueChanged<String> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF133A67), Color(0xFF0F2E52)],
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.apartment_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'النظام الإداري',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  AppConstants.appName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final item = appNavigationItems[index];
                final isSelected = _matchesPath(item.path, currentLocation);

                return _SidebarDestinationTile(
                  item: item,
                  isSelected: isSelected,
                  onTap: () => onDestinationSelected(item.path),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemCount: appNavigationItems.length,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'واجهة رئيسية هادئة ومناسبة للشاشات الكبيرة، مع تنقل واضح بين الأقسام.',
              style: TextStyle(color: Colors.white70, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }

  bool _matchesPath(String itemPath, String location) {
    if (itemPath == AppRoutes.dashboard) {
      return location == AppRoutes.dashboard;
    }

    return location.startsWith(itemPath);
  }
}

class _SidebarDestinationTile extends StatelessWidget {
  const _SidebarDestinationTile({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final AppNavigationItem item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white
                : Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.08),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withValues(alpha: 0.10)
                      : Colors.white.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  item.icon,
                  color: isSelected ? AppColors.primary : Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.textPrimary
                            : Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.textSecondary
                            : Colors.white70,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
