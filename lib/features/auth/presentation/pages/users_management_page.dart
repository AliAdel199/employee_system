import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/app_section_card.dart';
import '../../data/models/user_model.dart';
import '../providers/auth_providers.dart';
import '../widgets/reset_password_dialog.dart';
import '../widgets/user_form_dialog.dart';

class UsersManagementPage extends ConsumerWidget {
  const UsersManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersListProvider);
    final currentUser = ref.watch(currentUserProvider);

    return Container(
      color: AppColors.background,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AppSectionCard(
            title: 'إدارة المستخدمين',
            subtitle: 'إنشاء حسابات الدخول لكل جهاز وتحديد صلاحيات كل مستخدم.',
            action: FilledButton.icon(
              onPressed: () => _openUserForm(context),
              icon: const Icon(Icons.person_add_alt_1_rounded),
              label: const Text('إضافة مستخدم'),
            ),
            child: usersAsync.when(
              data: (users) {
                if (users.isEmpty) {
                  return const _EmptyUsersState();
                }

                return Column(
                  children: users
                      .map(
                        (user) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _UserTile(
                            user: user,
                            isCurrentUser: user.id == currentUser?.id,
                            onEdit: () => _openUserForm(context, user: user),
                            onResetPassword: () =>
                                _openResetPassword(context, user),
                            onToggleActive: () =>
                                _toggleActive(context, ref, user),
                            onDelete: () => _deleteUser(context, ref, user),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, _) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text('تعذر تحميل قائمة المستخدمين: $error'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openUserForm(BuildContext context, {UserModel? user}) {
    return showDialog<bool>(
      context: context,
      builder: (_) => UserFormDialog(user: user),
    );
  }

  Future<void> _openResetPassword(BuildContext context, UserModel user) {
    return showDialog<bool>(
      context: context,
      builder: (_) => ResetPasswordDialog(user: user),
    );
  }

  Future<void> _toggleActive(
    BuildContext context,
    WidgetRef ref,
    UserModel user,
  ) async {
    final authService = ref.read(authServiceProvider);

    if (user.isActive && user.role == UserRole.admin) {
      final remainingAdmins = await authService.countActiveAdmins(
        excludeId: user.id,
      );
      if (remainingAdmins == 0) {
        if (context.mounted) {
          _showMessage(
            context,
            'لا يمكن تعطيل هذا الحساب لأنه آخر مدير نشط في النظام.',
          );
        }
        return;
      }
    }

    await ref
        .read(userMutationControllerProvider.notifier)
        .setActive(user, !user.isActive);
  }

  Future<void> _deleteUser(
    BuildContext context,
    WidgetRef ref,
    UserModel user,
  ) async {
    final authService = ref.read(authServiceProvider);

    if (user.role == UserRole.admin) {
      final remainingAdmins = await authService.countActiveAdmins(
        excludeId: user.id,
      );
      if (remainingAdmins == 0) {
        if (context.mounted) {
          _showMessage(
            context,
            'لا يمكن حذف هذا الحساب لأنه آخر مدير نشط في النظام.',
          );
        }
        return;
      }
    }

    if (!context.mounted) {
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: Text('هل تريد حذف المستخدم "${user.fullName}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('حذف'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(userMutationControllerProvider.notifier).deleteUser(user.id);
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile({
    required this.user,
    required this.isCurrentUser,
    required this.onEdit,
    required this.onResetPassword,
    required this.onToggleActive,
    required this.onDelete,
  });

  final UserModel user;
  final bool isCurrentUser;
  final VoidCallback onEdit;
  final VoidCallback onResetPassword;
  final VoidCallback onToggleActive;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
            child: Icon(
              user.role == UserRole.admin
                  ? Icons.admin_panel_settings_rounded
                  : Icons.person_rounded,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(user.fullName, style: theme.textTheme.titleMedium),
                    if (isCurrentUser) ...[
                      const SizedBox(width: 8),
                      const _Badge(label: 'أنت', color: AppColors.primary),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Text('@${user.username}', style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          _Badge(
            label: user.role.label,
            color: user.role == UserRole.admin
                ? AppColors.primary
                : AppColors.textSecondary,
          ),
          const SizedBox(width: 8),
          _Badge(
            label: user.isActive ? 'مفعل' : 'معطل',
            color: user.isActive ? AppColors.success : Colors.red,
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'edit':
                  onEdit();
                  break;
                case 'reset_password':
                  onResetPassword();
                  break;
                case 'toggle_active':
                  onToggleActive();
                  break;
                case 'delete':
                  onDelete();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'edit', child: Text('تعديل البيانات')),
              const PopupMenuItem(
                value: 'reset_password',
                child: Text('إعادة تعيين كلمة المرور'),
              ),
              PopupMenuItem(
                value: 'toggle_active',
                child: Text(user.isActive ? 'تعطيل الحساب' : 'تفعيل الحساب'),
              ),
              const PopupMenuItem(value: 'delete', child: Text('حذف')),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 12),
      ),
    );
  }
}

class _EmptyUsersState extends StatelessWidget {
  const _EmptyUsersState();

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
          const Icon(Icons.people_outline_rounded, color: AppColors.primary),
          const SizedBox(height: 12),
          Text(
            'لا يوجد مستخدمون بعد',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
