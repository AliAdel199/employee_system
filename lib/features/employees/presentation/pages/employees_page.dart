import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/pdf_preview_dialog.dart';
import '../../../../shared/presentation/widgets/app_section_card.dart';
import '../../../organization/presentation/providers/organization_providers.dart';
import '../../../reports/presentation/providers/report_print_providers.dart';
import '../../../reports/presentation/providers/report_providers.dart';
import '../../employees.dart';

class EmployeesPage extends ConsumerStatefulWidget {
  const EmployeesPage({super.key});

  @override
  ConsumerState<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends ConsumerState<EmployeesPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    final filter = ref.read(employeeFilterProvider);
    _searchController = TextEditingController(text: filter.searchText);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(employeeFilterProvider);
    final employeesAsync = ref.watch(employeesProvider);
    final jobTitlesAsync = ref.watch(jobTitleOptionsProvider);
    final workplacesAsync = ref.watch(currentWorkplaceOptionsProvider);
    final mutationAsync = ref.watch(employeeMutationControllerProvider);
    final notifier = ref.read(employeeFilterProvider.notifier);

    return Container(
      color: AppColors.background,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AppSectionCard(
            title: 'إدارة الموظفين',
            subtitle:
                'البحث والفلترة واستعراض بيانات الموظفين داخل جدول منظم مناسب للشاشات الكبيرة.',
            action: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    notifier.reset();
                    _searchController.clear();
                  },
                  icon: const Icon(Icons.filter_alt_off_outlined),
                  label: const Text('مسح الفلاتر'),
                ),
                FilledButton.icon(
                  onPressed: () => context.go(AppRoutes.employeeCreate),
                  icon: const Icon(Icons.person_add_alt_1_rounded),
                  label: const Text('إضافة موظف'),
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
                _EmployeesFilterPanel(
                  searchController: _searchController,
                  filter: filter,
                  notifier: notifier,
                  jobTitlesAsync: jobTitlesAsync,
                  workplacesAsync: workplacesAsync,
                ),
                const SizedBox(height: 18),
                _EmployeesResultSummary(
                  filter: filter,
                  employeesAsync: employeesAsync,
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          AppSectionCard(
            title: 'جدول الموظفين',
            subtitle:
                'يعرض الصورة، الاسم، الرقم الوطني، الهاتف، العنوان الوظيفي، مكان العمل، والإجراءات.',
            child: employeesAsync.when(
              data: (employees) {
                if (employees.isEmpty) {
                  return _EmployeesEmptyState(
                    hasActiveFilters: _hasActiveFilters(filter),
                    onResetFilters: () {
                      notifier.reset();
                      _searchController.clear();
                    },
                  );
                }

                return _EmployeesDataTable(
                  employees: employees,
                  onView: (employee) {
                    showDialog<void>(
                      context: context,
                      builder: (_) => EmployeeDetailsDialog(
                        employee: employee,
                        onPrint: () => _openEmployeePrintPreview(employee),
                      ),
                    );
                  },
                  onEdit: (employee) =>
                      context.go(AppRoutes.employeeEdit(employee.id)),
                  onDelete: (employee) => _confirmDelete(context, employee),
                  onPrint: _openEmployeePrintPreview,
                );
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, _) =>
                  _EmployeesLoadError(message: error.toString()),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    EmployeeModel employee,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('تأكيد حذف الموظف'),
          content: Text(
            'هل تريد حذف الموظف "${employee.fullName}"؟ لا يمكن التراجع عن هذه العملية.',
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

    if (confirmed != true || !context.mounted) {
      return;
    }

    final success = await ref
        .read(employeeMutationControllerProvider.notifier)
        .deleteEmployee(employee.id);

    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'تم حذف الموظف بنجاح.'
              : 'تعذر حذف الموظف، يرجى المحاولة مرة أخرى.',
        ),
      ),
    );
  }

  bool _hasActiveFilters(EmployeeFilter filter) {
    return filter.hasSearchText ||
        filter.gender != null ||
        filter.maritalStatus != null ||
        filter.educationLevel != null ||
        filter.hasJobTitle ||
        filter.hasCurrentWorkplace;
  }

  Future<void> _openEmployeePrintPreview(EmployeeModel employee) async {
    final organizationInfo = ref.read(organizationInfoProvider).valueOrNull;
    final printService = ref.read(reportPrintServiceProvider);
    final employeeName = employee.fullName.trim().isEmpty
        ? 'استمارة موظف'
        : 'استمارة ${employee.fullName.trim()}';

    await showPdfPrintPreviewDialog(
      context: context,
      title: employeeName,
      fileName: 'employee_form_${employee.id}.pdf',
      buildDocument: (format) {
        return printService.buildDocument(
          reportType: ReportType.employeeForm,
          employees: [employee],
          organizationInfo: organizationInfo,
          selectedEmployee: employee,
          pageFormat: PdfPageFormat.a4,
        );
      },
    );
  }
}

class _EmployeesFilterPanel extends StatelessWidget {
  const _EmployeesFilterPanel({
    required this.searchController,
    required this.filter,
    required this.notifier,
    required this.jobTitlesAsync,
    required this.workplacesAsync,
  });

  final TextEditingController searchController;
  final EmployeeFilter filter;
  final EmployeeFilterNotifier notifier;
  final AsyncValue<List<String>> jobTitlesAsync;
  final AsyncValue<List<String>> workplacesAsync;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final searchWidth = constraints.maxWidth >= 1200
            ? 340.0
            : constraints.maxWidth >= 800
            ? 280.0
            : constraints.maxWidth;
        final dropdownWidth = constraints.maxWidth >= 800
            ? 220.0
            : constraints.maxWidth;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            SizedBox(
              width: searchWidth,
              child: TextField(
                controller: searchController,
                onChanged: notifier.setSearchText,
                decoration: const InputDecoration(
                  labelText: 'بحث',
                  hintText:
                      'الاسم، الرقم الوطني، الرقم الوظيفي، الهاتف، أو العنوان الوظيفي',
                  prefixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
            SizedBox(
              width: dropdownWidth,
              child: EmployeeFilterDropdown<Gender>(
                label: 'الجنس',
                value: filter.gender,
                items: Gender.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.label),
                      ),
                    )
                    .toList(),
                onChanged: notifier.setGender,
              ),
            ),
            SizedBox(
              width: dropdownWidth,
              child: EmployeeFilterDropdown<MaritalStatus>(
                label: 'الحالة الاجتماعية',
                value: filter.maritalStatus,
                items: MaritalStatus.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.label),
                      ),
                    )
                    .toList(),
                onChanged: notifier.setMaritalStatus,
              ),
            ),
            SizedBox(
              width: dropdownWidth,
              child: EmployeeFilterDropdown<EducationLevel>(
                label: 'التحصيل الدراسي',
                value: filter.educationLevel,
                items: EducationLevel.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.label),
                      ),
                    )
                    .toList(),
                onChanged: notifier.setEducationLevel,
              ),
            ),
            SizedBox(
              width: dropdownWidth,
              child: jobTitlesAsync.when(
                data: (values) {
                  return EmployeeFilterDropdown<String>(
                    label: 'العنوان الوظيفي',
                    value: filter.hasJobTitle
                        ? filter.normalizedJobTitle
                        : null,
                    items: values
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: notifier.setJobTitle,
                  );
                },
                loading: () =>
                    const _FilterLoadingField(label: 'العنوان الوظيفي'),
                error: (_, __) => const _FilterLoadingField(
                  label: 'العنوان الوظيفي',
                  hint: 'تعذر تحميل الخيارات',
                ),
              ),
            ),
            SizedBox(
              width: dropdownWidth,
              child: workplacesAsync.when(
                data: (values) {
                  return EmployeeFilterDropdown<String>(
                    label: 'مكان العمل',
                    value: filter.hasCurrentWorkplace
                        ? filter.normalizedCurrentWorkplace
                        : null,
                    items: values
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: notifier.setCurrentWorkplace,
                  );
                },
                loading: () => const _FilterLoadingField(label: 'مكان العمل'),
                error: (_, __) => const _FilterLoadingField(
                  label: 'مكان العمل',
                  hint: 'تعذر تحميل الخيارات',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _EmployeesResultSummary extends StatelessWidget {
  const _EmployeesResultSummary({
    required this.filter,
    required this.employeesAsync,
  });

  final EmployeeFilter filter;
  final AsyncValue<List<EmployeeModel>> employeesAsync;

  @override
  Widget build(BuildContext context) {
    final totalText = employeesAsync.when(
      data: (employees) => '${employees.length} سجل',
      loading: () => 'جارٍ التحميل...',
      error: (_, __) => 'تعذر القراءة',
    );

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _SummaryChip(
          icon: Icons.inventory_2_outlined,
          label: 'النتائج الحالية',
          value: totalText,
        ),
        _SummaryChip(
          icon: Icons.filter_alt_outlined,
          label: 'حالة الفلاتر',
          value: _filtersText,
        ),
      ],
    );
  }

  String get _filtersText {
    final count = [
      filter.hasSearchText,
      filter.gender != null,
      filter.maritalStatus != null,
      filter.educationLevel != null,
      filter.hasJobTitle,
      filter.hasCurrentWorkplace,
    ].where((value) => value).length;

    if (count == 0) {
      return 'بدون فلاتر';
    }

    return '$count فلتر نشط';
  }
}

class _SummaryChip extends StatelessWidget {
  const _SummaryChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Text('$label: ', style: Theme.of(context).textTheme.bodyMedium),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmployeesDataTable extends StatefulWidget {
  const _EmployeesDataTable({
    required this.employees,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
    required this.onPrint,
  });

  final List<EmployeeModel> employees;
  final ValueChanged<EmployeeModel> onView;
  final ValueChanged<EmployeeModel> onEdit;
  final ValueChanged<EmployeeModel> onDelete;
  final ValueChanged<EmployeeModel> onPrint;

  @override
  State<_EmployeesDataTable> createState() => _EmployeesDataTableState();
}

class _EmployeesDataTableState extends State<_EmployeesDataTable> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employees = widget.employees;
    final onView = widget.onView;
    final onEdit = widget.onEdit;
    final onDelete = widget.onDelete;
    final onPrint = widget.onPrint;

    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 1180),
          child: DataTable(
            columnSpacing: 22,
            dataRowMinHeight: 72,
            dataRowMaxHeight: 88,
            headingRowColor: WidgetStatePropertyAll(
              AppColors.primary.withValues(alpha: 0.06),
            ),
            columns: const [
              DataColumn(label: Text('الصورة')),
              DataColumn(label: Text('الاسم')),
              DataColumn(label: Text('الرقم الوطني')),
              DataColumn(label: Text('الهاتف')),
              DataColumn(label: Text('العنوان الوظيفي')),
              DataColumn(label: Text('مكان العمل')),
              DataColumn(label: Text('الإجراءات')),
            ],
            rows: employees.map((employee) {
              return DataRow(
                cells: [
                  DataCell(_EmployeePhotoCell(photoPath: employee.photoPath)),
                  DataCell(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          employee.fullName.isEmpty
                              ? 'بدون اسم'
                              : employee.fullName,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          employee.employeeNumber.isEmpty
                              ? 'بدون رقم وظيفي'
                              : employee.employeeNumber,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Text(
                      employee.nationalNumber.isEmpty
                          ? 'غير مسجل'
                          : employee.nationalNumber,
                    ),
                  ),
                  DataCell(
                    Text(
                      employee.phoneNumber.isEmpty
                          ? 'غير مسجل'
                          : employee.phoneNumber,
                    ),
                  ),
                  DataCell(
                    Text(
                      employee.jobTitle.isEmpty
                          ? 'غير محدد'
                          : employee.jobTitle,
                    ),
                  ),
                  DataCell(
                    Text(
                      employee.currentWorkplace.isEmpty
                          ? 'غير محدد'
                          : employee.currentWorkplace,
                    ),
                  ),
                  DataCell(
                    EmployeeTableActions(
                      onView: () => onView(employee),
                      onEdit: () => onEdit(employee),
                      onDelete: () => onDelete(employee),
                      onPrint: () => onPrint(employee),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _EmployeePhotoCell extends StatelessWidget {
  const _EmployeePhotoCell({required this.photoPath});

  final String photoPath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: AppColors.primary.withValues(alpha: 0.10),
      child: const Icon(Icons.person_rounded, color: AppColors.primary),
    );
  }
}

class _EmployeesEmptyState extends StatelessWidget {
  const _EmployeesEmptyState({
    required this.hasActiveFilters,
    required this.onResetFilters,
  });

  final bool hasActiveFilters;
  final VoidCallback onResetFilters;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Icon(
              Icons.groups_2_outlined,
              color: AppColors.primary,
              size: 34,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            hasActiveFilters
                ? 'لا توجد نتائج مطابقة للفلاتر الحالية'
                : 'لا توجد بيانات موظفين بعد',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            hasActiveFilters
                ? 'جرّب تغيير شروط البحث أو مسح الفلاتر لعرض جميع السجلات.'
                : 'بمجرد إضافة أول موظف، سيظهر هنا الجدول الكامل مع جميع الإجراءات.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (hasActiveFilters) ...[
            const SizedBox(height: 18),
            OutlinedButton.icon(
              onPressed: onResetFilters,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('عرض جميع السجلات'),
            ),
          ],
        ],
      ),
    );
  }
}

class _EmployeesLoadError extends StatelessWidget {
  const _EmployeesLoadError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تعذر تحميل بيانات الموظفين',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(message, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _FilterLoadingField extends StatelessWidget {
  const _FilterLoadingField({
    required this.label,
    this.hint = 'جارٍ تحميل الخيارات',
  });

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: const Padding(
          padding: EdgeInsets.all(14),
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}
