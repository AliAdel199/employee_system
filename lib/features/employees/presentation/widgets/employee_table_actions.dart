import 'package:flutter/material.dart';

class EmployeeTableActions extends StatelessWidget {
  const EmployeeTableActions({
    super.key,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
    required this.onPrint,
  });

  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onPrint;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        IconButton(
          tooltip: 'عرض',
          onPressed: onView,
          icon: const Icon(Icons.visibility_outlined),
        ),
        IconButton(
          tooltip: 'تعديل',
          onPressed: onEdit,
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          tooltip: 'حذف',
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline_rounded),
        ),
        IconButton(
          tooltip: 'طباعة',
          onPressed: onPrint,
          icon: const Icon(Icons.print_outlined),
        ),
      ],
    );
  }
}
