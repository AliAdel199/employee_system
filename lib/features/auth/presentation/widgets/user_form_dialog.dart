import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/user_model.dart';
import '../providers/auth_providers.dart';

class UserFormDialog extends ConsumerStatefulWidget {
  const UserFormDialog({super.key, this.user});

  final UserModel? user;

  bool get isEditMode => user != null;

  @override
  ConsumerState<UserFormDialog> createState() => _UserFormDialogState();
}

class _UserFormDialogState extends ConsumerState<UserFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  UserRole _role = UserRole.user;
  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    final user = widget.user;
    _fullNameController = TextEditingController(text: user?.fullName ?? '');
    _usernameController = TextEditingController(text: user?.username ?? '');
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _role = user?.role ?? UserRole.user;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _errorMessage = null);

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!widget.isEditMode &&
        _passwordController.text != _confirmPasswordController.text) {
      setState(() => _errorMessage = 'كلمتا المرور غير متطابقتين');
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final authService = ref.read(authServiceProvider);
      final usernameTaken = await authService.existsByUsername(
        _usernameController.text,
        excludeId: widget.user?.id,
      );

      if (usernameTaken) {
        setState(() => _errorMessage = 'اسم المستخدم مستخدم من قبل');
        return;
      }

      final controller = ref.read(userMutationControllerProvider.notifier);

      if (widget.isEditMode) {
        final user = widget.user!
          ..fullName = _fullNameController.text.trim()
          ..username = _usernameController.text.trim()
          ..role = _role;
        await controller.updateUserInfo(user);
      } else {
        await controller.createUser(
          username: _usernameController.text,
          fullName: _fullNameController.text,
          password: _passwordController.text,
          role: _role,
        );
      }

      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (error) {
      setState(() => _errorMessage = 'تعذر حفظ البيانات: $error');
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEditMode ? 'تعديل بيانات المستخدم' : 'إضافة مستخدم جديد'),
      content: SizedBox(
        width: 420,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(labelText: 'الاسم الكامل'),
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'الرجاء إدخال الاسم الكامل'
                      : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'اسم المستخدم'),
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'الرجاء إدخال اسم المستخدم'
                      : null,
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<UserRole>(
                  initialValue: _role,
                  decoration: const InputDecoration(labelText: 'الصلاحية'),
                  items: UserRole.values
                      .map(
                        (role) => DropdownMenuItem(
                          value: role,
                          child: Text(role.label),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _role = value);
                    }
                  },
                ),
                if (!widget.isEditMode) ...[
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'كلمة المرور'),
                    validator: (value) => (value == null || value.length < 4)
                        ? 'كلمة المرور يجب ألا تقل عن 4 أحرف'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'تأكيد كلمة المرور',
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'الرجاء تأكيد كلمة المرور'
                        : null,
                  ),
                ],
                if (_errorMessage != null) ...[
                  const SizedBox(height: 14),
                  Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.of(context).pop(false),
          child: const Text('إلغاء'),
        ),
        FilledButton(
          onPressed: _isSubmitting ? null : _submit,
          child: _isSubmitting
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2.2),
                )
              : const Text('حفظ'),
        ),
      ],
    );
  }
}
