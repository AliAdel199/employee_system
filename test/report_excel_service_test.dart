import 'dart:typed_data';

import 'package:employee_system/features/reports/reports.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/sample_data.dart';

void main() {
  group('ReportExcelService', () {
    const service = ReportExcelService();

    test('تصدير جدول جميع الموظفين ينتج ملف xlsx صالحاً', () {
      final bytes = service.buildWorkbook(
        reportType: ReportType.allEmployees,
        employees: buildSampleEmployees(),
      );

      _expectValidXlsx(bytes);
    });

    test('تصدير استمارة موظف واحد ينتج ملف xlsx صالحاً', () {
      final employees = buildSampleEmployees();

      final bytes = service.buildWorkbook(
        reportType: ReportType.employeeForm,
        employees: employees,
        selectedEmployee: employees.first,
      );

      _expectValidXlsx(bytes);
    });

    test('تصدير استمارة موظف بدون تحديد موظف يرمي خطأً واضحاً', () {
      expect(
        () => service.buildWorkbook(
          reportType: ReportType.employeeForm,
          employees: const [],
        ),
        throwsStateError,
      );
    });

    test('تصدير تقرير بدون سجلات ينتج ملف xlsx صالحاً بدون بيانات', () {
      final bytes = service.buildWorkbook(
        reportType: ReportType.byGender,
        employees: const [],
      );

      _expectValidXlsx(bytes);
    });
  });
}

void _expectValidXlsx(Uint8List bytes) {
  expect(bytes, isNotEmpty);
  expect(bytes.length, greaterThan(500));
  // ملفات xlsx هي أرشيف ZIP، ويبدأ توقيعها الثنائي بـ 'PK'.
  expect(bytes[0], 0x50);
  expect(bytes[1], 0x4B);
}
