import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/pdf_preview_dialog.dart';
import '../../../../shared/presentation/widgets/app_section_card.dart';
import '../../../employees/employees.dart';
import '../../../organization/organization.dart';
import '../providers/report_print_providers.dart';
import '../providers/report_providers.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(reportFilterProvider);
    final notifier = ref.read(reportFilterProvider.notifier);
    final filteredEmployeesAsync = ref.watch(filteredReportEmployeesProvider);
    final allEmployeesAsync = ref.watch(allEmployeesProvider);
    final organizationAsync = ref.watch(reportOrganizationInfoProvider);
    final selectedEmployeeAsync = ref.watch(selectedReportEmployeeProvider);
    final jobTitlesAsync = ref.watch(jobTitleOptionsProvider);
    final workplacesAsync = ref.watch(currentWorkplaceOptionsProvider);
    final filteredEmployees =
        filteredEmployeesAsync.valueOrNull ?? const <EmployeeModel>[];
    final selectedEmployee = selectedEmployeeAsync.valueOrNull;
    final organizationInfo = organizationAsync.valueOrNull;

    return Container(
      color: AppColors.background,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AppSectionCard(
            title: 'التقارير',
            subtitle:
                'اختيار نوع التقرير وتطبيق الفلاتر ثم معاينة الإخراج الرسمي وطباعته مباشرة داخل النظام.',
            action: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                OutlinedButton.icon(
                  onPressed: filteredEmployeesAsync.isLoading
                      ? null
                      : () => _openPrintPreview(
                          context: context,
                          ref: ref,
                          filter: filter,
                          employees: filteredEmployees,
                          organizationInfo: organizationInfo,
                          selectedEmployee: selectedEmployee,
                        ),
                  icon: const Icon(Icons.print_outlined),
                  label: const Text('طباعة / PDF'),
                ),
                OutlinedButton.icon(
                  onPressed: filteredEmployeesAsync.isLoading
                      ? null
                      : () => _exportToExcel(
                          context: context,
                          ref: ref,
                          filter: filter,
                          employees: filteredEmployees,
                          selectedEmployee: selectedEmployee,
                        ),
                  icon: const Icon(Icons.grid_on_rounded),
                  label: const Text('تصدير Excel'),
                ),
              ],
            ),
            child: Column(
              children: [
                _ReportTypeSelector(
                  selectedType: filter.type,
                  onChanged: notifier.setType,
                ),
                const SizedBox(height: 18),
                _ReportFiltersPanel(
                  filter: filter,
                  notifier: notifier,
                  allEmployeesAsync: allEmployeesAsync,
                  jobTitlesAsync: jobTitlesAsync,
                  workplacesAsync: workplacesAsync,
                ),
                const SizedBox(height: 18),
                _ReportSummarySection(
                  filter: filter,
                  employeesAsync: filteredEmployeesAsync,
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          AppSectionCard(
            title: 'معاينة التقرير',
            subtitle:
                'معاينة محتوى التقرير الحالي قبل الطباعة أو إخراجه بصيغة PDF الرسمية.',
            child: organizationAsync.when(
              data: (organizationInfo) {
                return filteredEmployeesAsync.when(
                  data: (employees) {
                    return Column(
                      children: [
                        _ReportHeaderPreview(
                          organizationInfo: organizationInfo,
                          reportType: filter.type,
                          employeesCount: employees.length,
                        ),
                        const SizedBox(height: 18),
                        if (filter.type == ReportType.employeeForm)
                          selectedEmployeeAsync.when(
                            data: (employee) => employee == null
                                ? const _ReportEmptyState(
                                    title: 'لم يتم اختيار موظف',
                                    subtitle:
                                        'اختر موظفاً واحداً لعرض استمارة الموظف ضمن معاينة التقرير.',
                                  )
                                : _SingleEmployeeReportPreview(
                                    employee: employee,
                                  ),
                            loading: () => const _ReportLoadingState(),
                            error: (error, _) =>
                                _ReportErrorState(message: error.toString()),
                          )
                        else if (employees.isEmpty)
                          const _ReportEmptyState(
                            title: 'لا توجد نتائج لهذا التقرير',
                            subtitle:
                                'يمكن تعديل نوع التقرير أو تغيير الفلاتر لعرض سجلات مطابقة.',
                          )
                        else
                          _ReportEmployeesTable(employees: employees),
                      ],
                    );
                  },
                  loading: () => const _ReportLoadingState(),
                  error: (error, _) =>
                      _ReportErrorState(message: error.toString()),
                );
              },
              loading: () => const _ReportLoadingState(),
              error: (error, _) => _ReportErrorState(message: error.toString()),
            ),
          ),
        ],
      ),
    );
  }

  void _showSoon(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _openPrintPreview({
    required BuildContext context,
    required WidgetRef ref,
    required ReportFilterState filter,
    required List<EmployeeModel> employees,
    required OrganizationInfoModel? organizationInfo,
    required EmployeeModel? selectedEmployee,
  }) async {
    if (filter.type == ReportType.employeeForm && selectedEmployee == null) {
      _showSoon(context, 'اختر موظفاً أولاً قبل طباعة الاستمارة.');
      return;
    }

    if (filter.type != ReportType.employeeForm && employees.isEmpty) {
      _showSoon(context, 'لا توجد نتائج حالية لطباعة هذا التقرير.');
      return;
    }

    final printService = ref.read(reportPrintServiceProvider);

    await showPdfPrintPreviewDialog(
      context: context,
      title: filter.type == ReportType.employeeForm
          ? 'استمارة موظف'
          : filter.type.label,
      fileName: 'report_${filter.type.name}.pdf',
      buildDocument: (format) {
        return printService.buildDocument(
          reportType: filter.type,
          employees: employees,
          organizationInfo: organizationInfo,
          selectedEmployee: selectedEmployee,
          pageFormat: filter.type == ReportType.employeeForm
              ? PdfPageFormat.a4
              : PdfPageFormat.a4.landscape,
        );
      },
    );
  }

  Future<void> _exportToExcel({
    required BuildContext context,
    required WidgetRef ref,
    required ReportFilterState filter,
    required List<EmployeeModel> employees,
    required EmployeeModel? selectedEmployee,
  }) async {
    if (filter.type == ReportType.employeeForm && selectedEmployee == null) {
      _showSoon(context, 'اختر موظفاً أولاً قبل تصدير الاستمارة.');
      return;
    }

    if (filter.type != ReportType.employeeForm && employees.isEmpty) {
      _showSoon(context, 'لا توجد نتائج حالية لتصدير هذا التقرير.');
      return;
    }

    try {
      final excelService = ref.read(reportExcelServiceProvider);
      final bytes = excelService.buildWorkbook(
        reportType: filter.type,
        employees: employees,
        selectedEmployee: selectedEmployee,
      );

      final location = await getSaveLocation(
        suggestedName: 'report_${filter.type.name}.xlsx',
        acceptedTypeGroups: const [
          XTypeGroup(label: 'Excel', extensions: ['xlsx']),
        ],
      );
      if (location == null) {
        return;
      }

      await File(location.path).writeAsBytes(bytes);

      if (context.mounted) {
        _showSoon(context, 'تم تصدير ملف Excel بنجاح.');
      }
    } catch (error) {
      if (context.mounted) {
        _showSoon(context, 'تعذر تصدير ملف Excel: $error');
      }
    }
  }
}

class _ReportTypeSelector extends StatelessWidget {
  const _ReportTypeSelector({
    required this.selectedType,
    required this.onChanged,
  });

  final ReportType selectedType;
  final ValueChanged<ReportType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: ReportType.values.map((type) {
        final isSelected = selectedType == type;

        return InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => onChanged(type),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 220,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : AppColors.background,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
                width: isSelected ? 1.4 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type.label,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isSelected ? AppColors.primary : null,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  type.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ReportFiltersPanel extends StatelessWidget {
  const _ReportFiltersPanel({
    required this.filter,
    required this.notifier,
    required this.allEmployeesAsync,
    required this.jobTitlesAsync,
    required this.workplacesAsync,
  });

  final ReportFilterState filter;
  final ReportFilterNotifier notifier;
  final AsyncValue<List<EmployeeModel>> allEmployeesAsync;
  final AsyncValue<List<String>> jobTitlesAsync;
  final AsyncValue<List<String>> workplacesAsync;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final fieldWidth = constraints.maxWidth >= 800
            ? 240.0
            : constraints.maxWidth;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            if (filter.type == ReportType.byGender)
              SizedBox(
                width: fieldWidth,
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
            if (filter.type == ReportType.byMaritalStatus)
              SizedBox(
                width: fieldWidth,
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
            if (filter.type == ReportType.byEducationLevel)
              SizedBox(
                width: fieldWidth,
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
            if (filter.type == ReportType.byJobTitle)
              SizedBox(
                width: fieldWidth,
                child: jobTitlesAsync.when(
                  data: (values) => EmployeeFilterDropdown<String>(
                    label: 'العنوان الوظيفي',
                    value: filter.jobTitle,
                    items: values
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: notifier.setJobTitle,
                  ),
                  loading: () =>
                      const _ReportDisabledField(label: 'العنوان الوظيفي'),
                  error: (_, __) => const _ReportDisabledField(
                    label: 'العنوان الوظيفي',
                    hint: 'تعذر تحميل الخيارات',
                  ),
                ),
              ),
            if (filter.type == ReportType.byWorkplace)
              SizedBox(
                width: fieldWidth,
                child: workplacesAsync.when(
                  data: (values) => EmployeeFilterDropdown<String>(
                    label: 'مكان العمل',
                    value: filter.currentWorkplace,
                    items: values
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: notifier.setCurrentWorkplace,
                  ),
                  loading: () =>
                      const _ReportDisabledField(label: 'مكان العمل'),
                  error: (_, __) => const _ReportDisabledField(
                    label: 'مكان العمل',
                    hint: 'تعذر تحميل الخيارات',
                  ),
                ),
              ),
            if (filter.type == ReportType.employeeForm)
              SizedBox(
                width: fieldWidth,
                child: allEmployeesAsync.when(
                  data: (employees) => EmployeeFilterDropdown<int>(
                    label: 'الموظف',
                    value: filter.employeeId,
                    items: employees
                        .map(
                          (employee) => DropdownMenuItem(
                            value: employee.id,
                            child: Text(
                              employee.fullName.isEmpty
                                  ? 'بدون اسم'
                                  : employee.fullName,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: notifier.setEmployeeId,
                  ),
                  loading: () => const _ReportDisabledField(label: 'الموظف'),
                  error: (_, __) => const _ReportDisabledField(
                    label: 'الموظف',
                    hint: 'تعذر تحميل الموظفين',
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _ReportSummarySection extends StatelessWidget {
  const _ReportSummarySection({
    required this.filter,
    required this.employeesAsync,
  });

  final ReportFilterState filter;
  final AsyncValue<List<EmployeeModel>> employeesAsync;

  @override
  Widget build(BuildContext context) {
    final countText = employeesAsync.when(
      data: (employees) => '${employees.length} سجل',
      loading: () => 'جارٍ التحميل...',
      error: (_, __) => 'تعذر القراءة',
    );

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _ReportSummaryChip(
          icon: Icons.summarize_outlined,
          label: 'نوع التقرير',
          value: filter.type.label,
        ),
        _ReportSummaryChip(
          icon: Icons.inventory_2_outlined,
          label: 'عدد السجلات',
          value: countText,
        ),
      ],
    );
  }
}

class _ReportSummaryChip extends StatelessWidget {
  const _ReportSummaryChip({
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

class _ReportHeaderPreview extends StatelessWidget {
  const _ReportHeaderPreview({
    required this.organizationInfo,
    required this.reportType,
    required this.employeesCount,
  });

  final OrganizationInfoModel? organizationInfo;
  final ReportType reportType;
  final int employeesCount;

  @override
  Widget build(BuildContext context) {
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
            organizationInfo?.ministryName.trim().isNotEmpty == true
                ? organizationInfo!.ministryName
                : 'اسم الوزارة غير محدد',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          Text(
            organizationInfo?.organizationName.trim().isNotEmpty == true
                ? organizationInfo!.organizationName
                : 'اسم المؤسسة غير محدد',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _ReportSummaryChip(
                icon: Icons.description_outlined,
                label: 'التقرير',
                value: reportType.label,
              ),
              _ReportSummaryChip(
                icon: Icons.groups_2_outlined,
                label: 'عدد السجلات',
                value: '$employeesCount',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SingleEmployeeReportPreview extends StatelessWidget {
  const _SingleEmployeeReportPreview({required this.employee});

  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          _EmployeeInfoTile(label: 'الاسم', value: _value(employee.fullName)),
          _EmployeeInfoTile(
            label: 'الرقم الوظيفي',
            value: _value(employee.employeeNumber),
          ),
          _EmployeeInfoTile(
            label: 'الرقم الوطني',
            value: _value(employee.nationalNumber),
          ),
          _EmployeeInfoTile(
            label: 'الجنس',
            value: employee.gender?.label ?? 'غير محدد',
          ),
          _EmployeeInfoTile(
            label: 'الحالة الاجتماعية',
            value: employee.maritalStatus?.label ?? 'غير محدد',
          ),
          _EmployeeInfoTile(
            label: 'التحصيل الدراسي',
            value: employee.educationLevel?.label ?? 'غير محدد',
          ),
          _EmployeeInfoTile(
            label: 'العنوان الوظيفي',
            value: _value(employee.jobTitle),
          ),
          _EmployeeInfoTile(
            label: 'مكان العمل',
            value: _value(employee.currentWorkplace),
          ),
          _EmployeeInfoTile(
            label: 'العنوان',
            value: _value(employee.address),
            fullWidth: true,
          ),
          _EmployeeInfoTile(
            label: 'الملاحظات العامة',
            value: _value(employee.generalNotes),
            fullWidth: true,
          ),
        ],
      ),
    );
  }

  String _value(String value) {
    return value.trim().isEmpty ? 'غير مسجل' : value.trim();
  }
}

class _EmployeeInfoTile extends StatelessWidget {
  const _EmployeeInfoTile({
    required this.label,
    required this.value,
    this.fullWidth = false,
  });

  final String label;
  final String value;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : 280,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _ReportEmployeesTable extends StatefulWidget {
  const _ReportEmployeesTable({required this.employees});

  final List<EmployeeModel> employees;

  @override
  State<_ReportEmployeesTable> createState() => _ReportEmployeesTableState();
}

class _ReportEmployeesTableState extends State<_ReportEmployeesTable> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employees = widget.employees;

    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 980),
          child: DataTable(
            columnSpacing: 22,
            headingRowColor: WidgetStatePropertyAll(
              AppColors.primary.withValues(alpha: 0.06),
            ),
            columns: const [
              DataColumn(label: Text('الاسم')),
              DataColumn(label: Text('الرقم الوظيفي')),
              DataColumn(label: Text('الجنس')),
              DataColumn(label: Text('الحالة الاجتماعية')),
              DataColumn(label: Text('التحصيل الدراسي')),
              DataColumn(label: Text('العنوان الوظيفي')),
              DataColumn(label: Text('مكان العمل')),
            ],
            rows: employees.map((employee) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      employee.fullName.isEmpty
                          ? 'بدون اسم'
                          : employee.fullName,
                    ),
                  ),
                  DataCell(
                    Text(
                      employee.employeeNumber.isEmpty
                          ? 'غير مسجل'
                          : employee.employeeNumber,
                    ),
                  ),
                  DataCell(Text(employee.gender?.label ?? 'غير محدد')),
                  DataCell(Text(employee.maritalStatus?.label ?? 'غير محدد')),
                  DataCell(Text(employee.educationLevel?.label ?? 'غير محدد')),
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
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ReportEmptyState extends StatelessWidget {
  const _ReportEmptyState({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

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
              Icons.assessment_outlined,
              color: AppColors.primary,
              size: 34,
            ),
          ),
          const SizedBox(height: 16),
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

class _ReportLoadingState extends StatelessWidget {
  const _ReportLoadingState();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _ReportErrorState extends StatelessWidget {
  const _ReportErrorState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: Text(message, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

class _ReportDisabledField extends StatelessWidget {
  const _ReportDisabledField({
    required this.label,
    this.hint = 'جارٍ تحميل الخيارات',
  });

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }
}
