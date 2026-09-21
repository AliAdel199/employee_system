import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/data/managed_photo_store.dart';
import '../../../../shared/presentation/widgets/app_section_card.dart';
import '../../employees.dart';

class EmployeeFormPage extends ConsumerStatefulWidget {
  const EmployeeFormPage({super.key, this.employeeId});

  final int? employeeId;

  bool get isEditMode => employeeId != null;

  @override
  ConsumerState<EmployeeFormPage> createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends ConsumerState<EmployeeFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _fullNameController;
  late final TextEditingController _birthPlaceController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _nationalNumberController;
  late final TextEditingController _nationalCardNumberController;
  late final TextEditingController _housingCardNumberController;
  late final TextEditingController _documentsIssueAuthorityController;
  late final TextEditingController _employeeNumberController;
  late final TextEditingController _jobTitleController;
  late final TextEditingController _currentWorkplaceController;
  late final TextEditingController _previousWorkplaceController;
  late final TextEditingController _jobNotesController;
  late final TextEditingController _generalNotesController;
  late final TextEditingController _birthDateController;
  late final TextEditingController _documentsIssueDateController;

  EmployeeModel? _employee;
  bool _isLoadingEmployee = false;
  String? _loadErrorMessage;

  Gender? _gender;
  MaritalStatus? _maritalStatus;
  EducationLevel? _educationLevel;
  DateTime? _birthDate;
  DateTime? _documentsIssueDate;
  String _photoPath = '';

  /// المسار كما كان محفوظاً في قاعدة البيانات قبل بدء هذه الجلسة، يُستخدم
  /// لتنظيف الصورة القديمة بعد نجاح الحفظ فقط (وليس فوراً عند الاختيار)، حتى
  /// لا تُحذف صورة السجل الحالي إن ألغى المستخدم التعديل دون حفظ.
  String _originalPhotoPath = '';

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _birthPlaceController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _nationalNumberController = TextEditingController();
    _nationalCardNumberController = TextEditingController();
    _housingCardNumberController = TextEditingController();
    _documentsIssueAuthorityController = TextEditingController();
    _employeeNumberController = TextEditingController();
    _jobTitleController = TextEditingController();
    _currentWorkplaceController = TextEditingController();
    _previousWorkplaceController = TextEditingController();
    _jobNotesController = TextEditingController();
    _generalNotesController = TextEditingController();
    _birthDateController = TextEditingController();
    _documentsIssueDateController = TextEditingController();

    if (widget.isEditMode) {
      _loadEmployee();
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _birthPlaceController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _nationalNumberController.dispose();
    _nationalCardNumberController.dispose();
    _housingCardNumberController.dispose();
    _documentsIssueAuthorityController.dispose();
    _employeeNumberController.dispose();
    _jobTitleController.dispose();
    _currentWorkplaceController.dispose();
    _previousWorkplaceController.dispose();
    _jobNotesController.dispose();
    _generalNotesController.dispose();
    _birthDateController.dispose();
    _documentsIssueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mutationAsync = ref.watch(employeeMutationControllerProvider);
    final isBusy = mutationAsync.isLoading || _isLoadingEmployee;

    return Container(
      color: AppColors.background,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AppSectionCard(
            title: widget.isEditMode
                ? 'تعديل بيانات الموظف'
                : 'إضافة موظف جديد',
            subtitle:
                'نموذج موحّد يدعم الإدخال والتعديل مع تقسيم واضح للمعلومات الشخصية والمستمسكات والبيانات الوظيفية.',
            action: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                OutlinedButton.icon(
                  onPressed: isBusy ? null : () => context.pop(),
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text('رجوع'),
                ),
                FilledButton.icon(
                  onPressed: isBusy ? null : _saveEmployee,
                  icon: const Icon(Icons.save_outlined),
                  label: Text(
                    widget.isEditMode ? 'حفظ التعديلات' : 'حفظ الموظف',
                  ),
                ),
              ],
            ),
            child: Column(
              children: [
                if (isBusy)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: LinearProgressIndicator(minHeight: 3),
                  ),
                if (_loadErrorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _FormErrorMessage(message: _loadErrorMessage!),
                  ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _EmployeePhotoSection(
                        photoPath: _photoPath,
                        onPickImage: isBusy ? null : _pickImage,
                        onRemoveImage: isBusy || _photoPath.isEmpty
                            ? null
                            : _removeImage,
                      ),
                      const SizedBox(height: 18),
                      AppSectionCard(
                        title: 'المعلومات الشخصية',
                        child: _FormFieldsWrap(
                          children: [
                            _buildTextField(
                              controller: _fullNameController,
                              label: 'الاسم الرباعي',
                              hint: 'أدخل الاسم الكامل',
                              validator: _requiredValidator,
                            ),
                            _buildDropdownField<Gender>(
                              label: 'الجنس',
                              value: _gender,
                              items: Gender.values
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value.label),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                              validator: (value) =>
                                  value == null ? 'يرجى اختيار الجنس' : null,
                            ),
                            _buildDateField(
                              controller: _birthDateController,
                              label: 'تاريخ الولادة',
                              onTap: isBusy
                                  ? null
                                  : () => _pickDate(
                                      initialDate: _birthDate ?? DateTime(1990),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now(),
                                      onSelected: (date) {
                                        setState(() {
                                          _birthDate = date;
                                          _birthDateController.text =
                                              _formatDate(date);
                                        });
                                      },
                                    ),
                            ),
                            _buildTextField(
                              controller: _birthPlaceController,
                              label: 'محل الولادة',
                              hint: 'المدينة أو المحافظة',
                            ),
                            _buildDropdownField<MaritalStatus>(
                              label: 'الحالة الاجتماعية',
                              value: _maritalStatus,
                              items: MaritalStatus.values
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value.label),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _maritalStatus = value;
                                });
                              },
                            ),
                            _buildTextField(
                              controller: _phoneController,
                              label: 'رقم الهاتف',
                              hint: '07xxxxxxxxx',
                              keyboardType: TextInputType.phone,
                            ),
                            _buildDropdownField<EducationLevel>(
                              label: 'التحصيل الدراسي',
                              value: _educationLevel,
                              items: EducationLevel.values
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value.label),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _educationLevel = value;
                                });
                              },
                            ),
                            _buildTextField(
                              controller: _addressController,
                              label: 'العنوان',
                              hint: 'المنطقة / المدينة / المحافظة',
                              maxLines: 2,
                              fullWidth: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      AppSectionCard(
                        title: 'المستمسكات',
                        child: _FormFieldsWrap(
                          children: [
                            _buildTextField(
                              controller: _nationalNumberController,
                              label: 'الرقم الوطني',
                              hint: 'أدخل الرقم الوطني',
                              validator: _requiredValidator,
                            ),
                            _buildTextField(
                              controller: _nationalCardNumberController,
                              label: 'رقم البطاقة الوطنية',
                              hint: 'أدخل رقم البطاقة الوطنية',
                            ),
                            _buildTextField(
                              controller: _housingCardNumberController,
                              label: 'رقم بطاقة السكن',
                              hint: 'أدخل رقم بطاقة السكن',
                            ),
                            _buildDateField(
                              controller: _documentsIssueDateController,
                              label: 'تاريخ الإصدار',
                              onTap: isBusy
                                  ? null
                                  : () => _pickDate(
                                      initialDate:
                                          _documentsIssueDate ?? DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now(),
                                      onSelected: (date) {
                                        setState(() {
                                          _documentsIssueDate = date;
                                          _documentsIssueDateController.text =
                                              _formatDate(date);
                                        });
                                      },
                                    ),
                            ),
                            _buildTextField(
                              controller: _documentsIssueAuthorityController,
                              label: 'جهة الإصدار',
                              hint: 'الجهة التي أصدرت المستمسكات',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      AppSectionCard(
                        title: 'المعلومات الوظيفية',
                        child: _FormFieldsWrap(
                          children: [
                            _buildTextField(
                              controller: _employeeNumberController,
                              label: 'الرقم الوظيفي',
                              hint: 'أدخل الرقم الوظيفي',
                              validator: _requiredValidator,
                            ),
                            _buildTextField(
                              controller: _jobTitleController,
                              label: 'العنوان الوظيفي',
                              hint: 'مثل: موظف إداري',
                              validator: _requiredValidator,
                            ),
                            _buildTextField(
                              controller: _currentWorkplaceController,
                              label: 'مكان العمل الحالي',
                              hint: 'القسم أو الموقع الحالي',
                              validator: _requiredValidator,
                            ),
                            _buildTextField(
                              controller: _previousWorkplaceController,
                              label: 'مكان العمل السابق',
                              hint: 'يُترك فارغاً عند عدم وجوده',
                            ),
                            _buildTextField(
                              controller: _jobNotesController,
                              label: 'ملاحظات وظيفية',
                              hint: 'أية ملاحظات متعلقة بالمسار الوظيفي',
                              maxLines: 3,
                              fullWidth: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      AppSectionCard(
                        title: 'ملاحظات عامة',
                        child: _FormFieldsWrap(
                          children: [
                            _buildTextField(
                              controller: _generalNotesController,
                              label: 'الملاحظات العامة',
                              hint: 'أضف أية ملاحظات إضافية هنا',
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
        ],
      ),
    );
  }

  Future<void> _loadEmployee() async {
    setState(() {
      _isLoadingEmployee = true;
      _loadErrorMessage = null;
    });

    try {
      final employee = await ref
          .read(employeeServiceProvider)
          .getEmployeeById(widget.employeeId!);

      if (employee == null) {
        setState(() {
          _loadErrorMessage = 'تعذر العثور على بيانات الموظف المطلوب.';
          _isLoadingEmployee = false;
        });
        return;
      }

      _employee = employee;
      _fullNameController.text = employee.fullName;
      _birthPlaceController.text = employee.birthPlace;
      _phoneController.text = employee.phoneNumber;
      _addressController.text = employee.address;
      _nationalNumberController.text = employee.nationalNumber;
      _nationalCardNumberController.text = employee.nationalCardNumber;
      _housingCardNumberController.text = employee.housingCardNumber;
      _documentsIssueAuthorityController.text =
          employee.documentsIssueAuthority;
      _employeeNumberController.text = employee.employeeNumber;
      _jobTitleController.text = employee.jobTitle;
      _currentWorkplaceController.text = employee.currentWorkplace;
      _previousWorkplaceController.text = employee.previousWorkplace;
      _jobNotesController.text = employee.jobNotes;
      _generalNotesController.text = employee.generalNotes;
      _birthDate = employee.birthDate;
      _documentsIssueDate = employee.documentsIssueDate;
      _birthDateController.text = _formatOptionalDate(employee.birthDate);
      _documentsIssueDateController.text = _formatOptionalDate(
        employee.documentsIssueDate,
      );
      _gender = employee.gender;
      _maritalStatus = employee.maritalStatus;
      _educationLevel = employee.educationLevel;
      _photoPath = employee.photoPath;
      _originalPhotoPath = employee.photoPath;
    } catch (error) {
      _loadErrorMessage = error.toString();
    }

    if (mounted) {
      setState(() {
        _isLoadingEmployee = false;
      });
    }
  }

  Future<void> _pickImage() async {
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
      final previousPendingPath = _photoPath;

      setState(() {
        _photoPath = managedPath;
      });

      // نحذف فقط نسخة مؤقتة أُنشئت خلال هذه الجلسة ولم تُحفظ بعد؛ الصورة
      // الأصلية المحمّلة من قاعدة البيانات تبقى حتى ينجح الحفظ.
      if (previousPendingPath.isNotEmpty &&
          previousPendingPath != managedPath &&
          previousPendingPath != _originalPhotoPath) {
        await ManagedPhotoStore.deleteIfManaged(previousPendingPath);
      }
    } catch (error) {
      if (mounted) {
        _showErrorMessage('تعذر حفظ الصورة المختارة: $error');
      }
    }
  }

  Future<void> _removeImage() async {
    final previousPendingPath = _photoPath;

    setState(() {
      _photoPath = '';
    });

    if (previousPendingPath.isNotEmpty &&
        previousPendingPath != _originalPhotoPath) {
      await ManagedPhotoStore.deleteIfManaged(previousPendingPath);
    }
  }

  Future<void> _pickDate({
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    required ValueChanged<DateTime> onSelected,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      locale: const Locale('ar'),
    );

    if (picked != null) {
      onSelected(picked);
    }
  }

  Future<void> _saveEmployee() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final service = ref.read(employeeServiceProvider);
    final currentId = _employee?.id;
    final nationalNumber = _nationalNumberController.text.trim();
    final employeeNumber = _employeeNumberController.text.trim();

    final nationalExists = await service.existsByNationalNumber(
      nationalNumber,
      excludeId: currentId,
    );
    if (nationalExists) {
      _showErrorMessage('الرقم الوطني مستخدم لموظف آخر.');
      return;
    }

    final employeeNumberExists = await service.existsByEmployeeNumber(
      employeeNumber,
      excludeId: currentId,
    );
    if (employeeNumberExists) {
      _showErrorMessage('الرقم الوظيفي مستخدم لموظف آخر.');
      return;
    }

    final employee = _employee ?? EmployeeModel();
    employee.fullName = _fullNameController.text.trim();
    employee.gender = _gender;
    employee.birthDate = _birthDate;
    employee.birthPlace = _birthPlaceController.text.trim();
    employee.maritalStatus = _maritalStatus;
    employee.phoneNumber = _phoneController.text.trim();
    employee.educationLevel = _educationLevel;
    employee.address = _addressController.text.trim();
    employee.photoPath = _photoPath.trim();
    employee.nationalNumber = nationalNumber;
    employee.nationalCardNumber = _nationalCardNumberController.text.trim();
    employee.housingCardNumber = _housingCardNumberController.text.trim();
    employee.documentsIssueDate = _documentsIssueDate;
    employee.documentsIssueAuthority = _documentsIssueAuthorityController.text
        .trim();
    employee.employeeNumber = employeeNumber;
    employee.jobTitle = _jobTitleController.text.trim();
    employee.currentWorkplace = _currentWorkplaceController.text.trim();
    employee.previousWorkplace = _previousWorkplaceController.text.trim();
    employee.jobNotes = _jobNotesController.text.trim();
    employee.generalNotes = _generalNotesController.text.trim();

    final photoToCleanupAfterSave = _originalPhotoPath;

    try {
      await ref
          .read(employeeMutationControllerProvider.notifier)
          .saveEmployee(employee);

      // بعد نجاح الحفظ فقط: نحذف الصورة القديمة إن استُبدلت بأخرى جديدة.
      if (photoToCleanupAfterSave.isNotEmpty &&
          photoToCleanupAfterSave != employee.photoPath) {
        await ManagedPhotoStore.deleteIfManaged(photoToCleanupAfterSave);
      }
      _originalPhotoPath = employee.photoPath;

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.isEditMode
                ? 'تم حفظ تعديلات الموظف بنجاح.'
                : 'تمت إضافة الموظف بنجاح.',
          ),
        ),
      );

      context.pop();
    } catch (error) {
      if (!mounted) {
        return;
      }

      _showErrorMessage(error.toString());
    }
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    return null;
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  String _formatDate(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }

  String _formatOptionalDate(DateTime? date) {
    return date == null ? '' : _formatDate(date);
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
    return _FormFieldContainer(
      fullWidth: fullWidth,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(labelText: label, hintText: hint),
      ),
    );
  }

  Widget _buildDropdownField<T>({
    required String label,
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
    String? Function(T?)? validator,
  }) {
    return _FormFieldContainer(
      child: DropdownButtonFormField<T>(
        initialValue: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Widget _buildDateField({
    required TextEditingController controller,
    required String label,
    required VoidCallback? onTap,
  }) {
    return _FormFieldContainer(
      child: TextFormField(
        controller: controller,
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: const Icon(Icons.calendar_month_outlined),
        ),
      ),
    );
  }
}

class _EmployeePhotoSection extends StatelessWidget {
  const _EmployeePhotoSection({
    required this.photoPath,
    required this.onPickImage,
    required this.onRemoveImage,
  });

  final String photoPath;
  final VoidCallback? onPickImage;
  final VoidCallback? onRemoveImage;

  @override
  Widget build(BuildContext context) {
    final hasImage =
        photoPath.trim().isNotEmpty && File(photoPath).existsSync();

    return AppSectionCard(
      title: 'الصورة الشخصية',
      subtitle: 'يمكن اختيار صورة للموظف من جهاز الحاسوب.',
      child: Row(
        children: [
          Container(
            width: 112,
            height: 112,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(22),
              image: hasImage
                  ? DecorationImage(
                      image: FileImage(File(photoPath)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: hasImage
                ? null
                : const Icon(
                    Icons.person_rounded,
                    size: 54,
                    color: AppColors.primary,
                  ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasImage ? photoPath : 'لم يتم اختيار صورة بعد',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: onPickImage,
                      icon: const Icon(Icons.photo_library_outlined),
                      label: const Text('اختيار صورة'),
                    ),
                    OutlinedButton.icon(
                      onPressed: onRemoveImage,
                      icon: const Icon(Icons.delete_outline_rounded),
                      label: const Text('إزالة الصورة'),
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

class _FormFieldsWrap extends StatelessWidget {
  const _FormFieldsWrap({required this.children});

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
            if (child is _FormFieldContainer && child.fullWidth) {
              return SizedBox(width: constraints.maxWidth, child: child.child);
            }

            return SizedBox(width: width, child: child);
          }).toList(),
        );
      },
    );
  }
}

class _FormFieldContainer extends StatelessWidget {
  const _FormFieldContainer({required this.child, this.fullWidth = false});

  final Widget child;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class _FormErrorMessage extends StatelessWidget {
  const _FormErrorMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: Text(
        message,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
      ),
    );
  }
}
