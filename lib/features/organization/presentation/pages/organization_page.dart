import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/data/managed_photo_store.dart';
import '../../../../shared/presentation/widgets/app_section_card.dart';
import '../../organization.dart';

class OrganizationPage extends ConsumerStatefulWidget {
  const OrganizationPage({super.key});

  @override
  ConsumerState<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends ConsumerState<OrganizationPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _ministryNameController;
  late final TextEditingController _organizationNameController;
  late final TextEditingController _branchNameController;
  late final TextEditingController _departmentNameController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _reportsFooterController;

  OrganizationInfoModel? _currentInfo;
  bool _didHydrate = false;
  String _logoPath = '';

  /// المسار كما كان محفوظاً قبل بدء هذه الجلسة، يُستخدم لتنظيف الشعار القديم
  /// بعد نجاح الحفظ فقط (وليس فوراً عند الاختيار).
  String _originalLogoPath = '';

  @override
  void initState() {
    super.initState();
    _ministryNameController = TextEditingController();
    _organizationNameController = TextEditingController();
    _branchNameController = TextEditingController();
    _departmentNameController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _reportsFooterController = TextEditingController();
  }

  @override
  void dispose() {
    _ministryNameController.dispose();
    _organizationNameController.dispose();
    _branchNameController.dispose();
    _departmentNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _reportsFooterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final organizationAsync = ref.watch(organizationInfoProvider);
    final mutationAsync = ref.watch(organizationInfoMutationControllerProvider);

    organizationAsync.whenData((info) {
      if (!_didHydrate) {
        _hydrateForm(info);
      }
    });

    return Container(
      color: AppColors.background,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AppSectionCard(
            title: 'معلومات المؤسسة',
            subtitle:
                'يُحفظ هنا السجل الرسمي الوحيد المستخدم تلقائياً داخل التقارير والطباعة وواجهة النظام.',
            action: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                if (_currentInfo != null)
                  OutlinedButton.icon(
                    onPressed: mutationAsync.isLoading ? null : _confirmDelete,
                    icon: const Icon(Icons.delete_outline_rounded),
                    label: const Text('حذف البيانات'),
                  ),
                FilledButton.icon(
                  onPressed: mutationAsync.isLoading
                      ? null
                      : _saveOrganizationInfo,
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('حفظ البيانات'),
                ),
              ],
            ),
            child: Column(
              children: [
                if (mutationAsync.isLoading)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: LinearProgressIndicator(minHeight: 3),
                  ),
                _OrganizationHeaderSummary(info: _currentInfo),
                const SizedBox(height: 18),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _OrganizationLogoSection(
                        logoPath: _logoPath,
                        onPickLogo: mutationAsync.isLoading ? null : _pickLogo,
                        onRemoveLogo:
                            mutationAsync.isLoading || _logoPath.isEmpty
                            ? null
                            : _removeLogo,
                      ),
                      const SizedBox(height: 18),
                      AppSectionCard(
                        title: 'البيانات الأساسية',
                        child: _OrganizationFieldsWrap(
                          children: [
                            _buildTextField(
                              controller: _ministryNameController,
                              label: 'اسم الوزارة',
                              hint: 'مثال: وزارة التربية',
                              validator: _requiredValidator,
                            ),
                            _buildTextField(
                              controller: _organizationNameController,
                              label: 'اسم المؤسسة',
                              hint: 'اسم الجهة أو المؤسسة',
                              validator: _requiredValidator,
                            ),
                            _buildTextField(
                              controller: _branchNameController,
                              label: 'اسم الفرع',
                              hint: 'الفرع أو المديرية',
                            ),
                            _buildTextField(
                              controller: _departmentNameController,
                              label: 'اسم القسم',
                              hint: 'القسم المسؤول',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      AppSectionCard(
                        title: 'بيانات التواصل',
                        child: _OrganizationFieldsWrap(
                          children: [
                            _buildTextField(
                              controller: _addressController,
                              label: 'العنوان',
                              hint: 'العنوان الكامل للمؤسسة',
                              maxLines: 2,
                              fullWidth: true,
                            ),
                            _buildTextField(
                              controller: _phoneController,
                              label: 'الهاتف',
                              hint: 'رقم الهاتف الرسمي',
                              keyboardType: TextInputType.phone,
                            ),
                            _buildTextField(
                              controller: _emailController,
                              label: 'البريد الإلكتروني',
                              hint: 'example@domain.com',
                              keyboardType: TextInputType.emailAddress,
                              validator: _emailValidator,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      AppSectionCard(
                        title: 'تذييل التقارير',
                        subtitle:
                            'يُستخدم تلقائياً لاحقاً في ملفات PDF والطباعة والتقارير الرسمية.',
                        child: _OrganizationFieldsWrap(
                          children: [
                            _buildTextField(
                              controller: _reportsFooterController,
                              label: 'تذييل التقارير',
                              hint: 'مثل: جميع الحقوق محفوظة ...',
                              maxLines: 4,
                              fullWidth: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          organizationAsync.when(
            data: (info) {
              return AppSectionCard(
                title: 'معاينة الاستخدام',
                subtitle:
                    'تصور سريع لكيفية ظهور البيانات داخل النظام والتقارير القادمة.',
                child: _OrganizationPreview(
                  ministryName: _ministryNameController.text.trim(),
                  organizationName: _organizationNameController.text.trim(),
                  branchName: _branchNameController.text.trim(),
                  departmentName: _departmentNameController.text.trim(),
                  phoneNumber: _phoneController.text.trim(),
                  email: _emailController.text.trim(),
                  footer: _reportsFooterController.text.trim(),
                  hasSavedData: info != null,
                ),
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, _) => AppSectionCard(
              title: 'تعذر تحميل بيانات المؤسسة',
              child: Text(error.toString()),
            ),
          ),
        ],
      ),
    );
  }

  void _hydrateForm(OrganizationInfoModel? info) {
    _currentInfo = info;
    _logoPath = info?.logoPath ?? '';
    _originalLogoPath = info?.logoPath ?? '';
    _ministryNameController.text = info?.ministryName ?? '';
    _organizationNameController.text = info?.organizationName ?? '';
    _branchNameController.text = info?.branchName ?? '';
    _departmentNameController.text = info?.departmentName ?? '';
    _addressController.text = info?.address ?? '';
    _phoneController.text = info?.phoneNumber ?? '';
    _emailController.text = info?.email ?? '';
    _reportsFooterController.text = info?.reportsFooter ?? '';
    _didHydrate = true;
  }

  Future<void> _pickLogo() async {
    const typeGroup = XTypeGroup(
      label: 'images',
      extensions: ['png', 'jpg', 'jpeg', 'bmp', 'webp'],
    );

    final file = await openFile(acceptedTypeGroups: [typeGroup]);
    if (file == null) {
      return;
    }

    try {
      final managedPath = await ManagedPhotoStore.importFile(file.path);
      final previousPendingPath = _logoPath;

      setState(() {
        _logoPath = managedPath;
      });

      if (previousPendingPath.isNotEmpty &&
          previousPendingPath != managedPath &&
          previousPendingPath != _originalLogoPath) {
        await ManagedPhotoStore.deleteIfManaged(previousPendingPath);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('تعذر حفظ الشعار المختار: $error')));
      }
    }
  }

  Future<void> _removeLogo() async {
    final previousPendingPath = _logoPath;

    setState(() {
      _logoPath = '';
    });

    if (previousPendingPath.isNotEmpty &&
        previousPendingPath != _originalLogoPath) {
      await ManagedPhotoStore.deleteIfManaged(previousPendingPath);
    }
  }

  Future<void> _saveOrganizationInfo() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final info = _currentInfo ?? OrganizationInfoModel();
    info.ministryName = _ministryNameController.text.trim();
    info.organizationName = _organizationNameController.text.trim();
    info.branchName = _branchNameController.text.trim();
    info.departmentName = _departmentNameController.text.trim();
    info.logoPath = _logoPath.trim();
    info.address = _addressController.text.trim();
    info.phoneNumber = _phoneController.text.trim();
    info.email = _emailController.text.trim();
    info.reportsFooter = _reportsFooterController.text.trim();

    final logoToCleanupAfterSave = _originalLogoPath;

    try {
      final savedInfo = await ref
          .read(organizationInfoMutationControllerProvider.notifier)
          .saveOrganizationInfo(info);

      if (logoToCleanupAfterSave.isNotEmpty &&
          logoToCleanupAfterSave != savedInfo.logoPath) {
        await ManagedPhotoStore.deleteIfManaged(logoToCleanupAfterSave);
      }

      setState(() {
        _currentInfo = savedInfo;
        _originalLogoPath = savedInfo.logoPath;
      });

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم حفظ معلومات المؤسسة بنجاح.')),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('حذف معلومات المؤسسة'),
          content: const Text(
            'هل تريد حذف بيانات المؤسسة الحالية؟ يمكن إدخالها مرة أخرى لاحقاً.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red.shade700,
              ),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) {
      return;
    }

    final success = await ref
        .read(organizationInfoMutationControllerProvider.notifier)
        .deleteOrganizationInfo();

    if (!mounted) {
      return;
    }

    if (success) {
      await ManagedPhotoStore.deleteIfManaged(_originalLogoPath);

      if (!mounted) {
        return;
      }

      setState(() {
        _currentInfo = null;
        _didHydrate = false;
        _logoPath = '';
        _originalLogoPath = '';
        _ministryNameController.clear();
        _organizationNameController.clear();
        _branchNameController.clear();
        _departmentNameController.clear();
        _addressController.clear();
        _phoneController.clear();
        _emailController.clear();
        _reportsFooterController.clear();
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success ? 'تم حذف معلومات المؤسسة.' : 'لا توجد بيانات محفوظة للحذف.',
        ),
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    return null;
  }

  String? _emailValidator(String? value) {
    final normalized = (value ?? '').trim();
    if (normalized.isEmpty) {
      return null;
    }

    final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailPattern.hasMatch(normalized)) {
      return 'صيغة البريد الإلكتروني غير صحيحة';
    }

    return null;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
    bool fullWidth = false,
  }) {
    return _OrganizationFieldContainer(
      fullWidth: fullWidth,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onChanged: (_) => setState(() {}),
        decoration: InputDecoration(labelText: label, hintText: hint),
      ),
    );
  }
}

class _OrganizationHeaderSummary extends StatelessWidget {
  const _OrganizationHeaderSummary({required this.info});

  final OrganizationInfoModel? info;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          _SummaryBadge(
            label: 'حالة السجل',
            value: info == null ? 'غير محفوظ' : 'محفوظ',
          ),
          _SummaryBadge(
            label: 'المؤسسة',
            value: info?.organizationName.trim().isNotEmpty == true
                ? info!.organizationName
                : 'غير محددة',
          ),
          _SummaryBadge(
            label: 'القسم',
            value: info?.departmentName.trim().isNotEmpty == true
                ? info!.departmentName
                : 'غير محدد',
          ),
        ],
      ),
    );
  }
}

class _SummaryBadge extends StatelessWidget {
  const _SummaryBadge({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(text: '$label: '),
            TextSpan(
              text: value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrganizationLogoSection extends StatelessWidget {
  const _OrganizationLogoSection({
    required this.logoPath,
    required this.onPickLogo,
    required this.onRemoveLogo,
  });

  final String logoPath;
  final VoidCallback? onPickLogo;
  final VoidCallback? onRemoveLogo;

  @override
  Widget build(BuildContext context) {
    final hasLogo = logoPath.trim().isNotEmpty && File(logoPath).existsSync();

    return AppSectionCard(
      title: 'شعار المؤسسة',
      subtitle: 'سيُستخدم لاحقاً داخل الواجهة والتقارير وملفات PDF.',
      child: Row(
        children: [
          Container(
            width: 112,
            height: 112,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(22),
              image: hasLogo
                  ? DecorationImage(
                      image: FileImage(File(logoPath)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: hasLogo
                ? null
                : const Icon(
                    Icons.apartment_rounded,
                    size: 48,
                    color: AppColors.primary,
                  ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasLogo ? logoPath : 'لم يتم اختيار شعار بعد',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: onPickLogo,
                      icon: const Icon(Icons.image_outlined),
                      label: const Text('اختيار شعار'),
                    ),
                    OutlinedButton.icon(
                      onPressed: onRemoveLogo,
                      icon: const Icon(Icons.delete_outline_rounded),
                      label: const Text('إزالة الشعار'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OrganizationFieldsWrap extends StatelessWidget {
  const _OrganizationFieldsWrap({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth >= 1200
            ? (constraints.maxWidth - 24) / 3
            : constraints.maxWidth >= 760
            ? (constraints.maxWidth - 12) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: children.map((child) {
            if (child is _OrganizationFieldContainer && child.fullWidth) {
              return SizedBox(width: constraints.maxWidth, child: child.child);
            }

            return SizedBox(width: width, child: child);
          }).toList(),
        );
      },
    );
  }
}

class _OrganizationFieldContainer extends StatelessWidget {
  const _OrganizationFieldContainer({
    required this.child,
    this.fullWidth = false,
  });

  final Widget child;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class _OrganizationPreview extends StatelessWidget {
  const _OrganizationPreview({
    required this.ministryName,
    required this.organizationName,
    required this.branchName,
    required this.departmentName,
    required this.phoneNumber,
    required this.email,
    required this.footer,
    required this.hasSavedData,
  });

  final String ministryName;
  final String organizationName;
  final String branchName;
  final String departmentName;
  final String phoneNumber;
  final String email;
  final String footer;
  final bool hasSavedData;

  @override
  Widget build(BuildContext context) {
    final branchAndDepartment = [
      if (branchName.isNotEmpty) branchName,
      if (departmentName.isNotEmpty) departmentName,
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ministryName.isEmpty ? 'اسم الوزارة' : ministryName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            organizationName.isEmpty ? 'اسم المؤسسة' : organizationName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          Text(
            branchAndDepartment.isEmpty
                ? 'الفرع / القسم'
                : branchAndDepartment.join(' - '),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _PreviewInfoChip(
                icon: Icons.phone_outlined,
                value: phoneNumber.isEmpty ? 'الهاتف غير محدد' : phoneNumber,
              ),
              _PreviewInfoChip(
                icon: Icons.email_outlined,
                value: email.isEmpty ? 'البريد غير محدد' : email,
              ),
              _PreviewInfoChip(
                icon: Icons.verified_outlined,
                value: hasSavedData ? 'السجل محفوظ' : 'السجل لم يُحفظ بعد',
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              footer.isEmpty ? 'سيظهر هنا تذييل التقارير بعد إدخاله.' : footer,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewInfoChip extends StatelessWidget {
  const _PreviewInfoChip({required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
