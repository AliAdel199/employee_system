import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/employee_model.dart';

class EmployeeDetailsDialog extends StatelessWidget {
  const EmployeeDetailsDialog({super.key, required this.employee, this.onPrint});

  final EmployeeModel employee;
  final VoidCallback? onPrint;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('تفاصيل الموظف'),
      content: SizedBox(
        width: 640,
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _InfoTile(label: 'الاسم', value: _fallback(employee.fullName)),
              _InfoTile(
                label: 'الرقم الوظيفي',
                value: _fallback(employee.employeeNumber),
              ),
              _InfoTile(
                label: 'الرقم الوطني',
                value: _fallback(employee.nationalNumber),
              ),
              _InfoTile(
                label: 'الهاتف',
                value: _fallback(employee.phoneNumber),
              ),
              _InfoTile(
                label: 'الجنس',
                value: employee.gender?.label ?? 'غير محدد',
              ),
              _InfoTile(
                label: 'الحالة الاجتماعية',
                value: employee.maritalStatus?.label ?? 'غير محدد',
              ),
              _InfoTile(
                label: 'التحصيل الدراسي',
                value: employee.educationLevel?.label ?? 'غير محدد',
              ),
              _InfoTile(
                label: 'العنوان الوظيفي',
                value: _fallback(employee.jobTitle),
              ),
              _InfoTile(
                label: 'مكان العمل الحالي',
                value: _fallback(employee.currentWorkplace),
              ),
              _InfoTile(
                label: 'مكان العمل السابق',
                value: _fallback(employee.previousWorkplace),
              ),
              _InfoTile(
                label: 'العنوان',
                value: _fallback(employee.address),
                fullWidth: true,
              ),
              _InfoTile(
                label: 'الملاحظات العامة',
                value: _fallback(employee.generalNotes),
                fullWidth: true,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إغلاق'),
        ),
        if (onPrint != null)
          FilledButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
              onPrint!();
            },
            icon: const Icon(Icons.print_outlined),
            label: const Text('طباعة'),
          ),
      ],
    );
  }

  String _fallback(String value) {
    return value.trim().isEmpty ? 'غير مسجل' : value.trim();
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
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
      width: fullWidth ? 600 : 292,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.background,
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
