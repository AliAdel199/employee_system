import 'package:flutter/material.dart';

class EmployeeFilterDropdown<T> extends StatelessWidget {
  const EmployeeFilterDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      isExpanded: true,
      items: [
        DropdownMenuItem<T>(value: null, child: const Text('الكل')),
        ...items,
      ],
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label),
    );
  }
}
