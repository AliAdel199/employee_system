import 'dart:typed_data';

import 'package:employee_system/features/reports/application/services/report_print_service.dart';
import 'package:employee_system/features/reports/presentation/providers/report_providers.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/sample_data.dart';

void main() {
  testWidgets('طباعة استمارة موظف واحد تنتج ملف PDF صالحاً', (tester) async {
    final employees = buildSampleEmployees();
    final organizationInfo = buildSampleOrganizationInfo();
    final service = ReportPrintService();

    final bytes = await service.buildDocument(
      reportType: ReportType.employeeForm,
      employees: employees,
      organizationInfo: organizationInfo,
      selectedEmployee: employees.first,
    );

    _expectValidPdf(bytes);
  });

  testWidgets('طباعة تقرير جميع الموظفين تنتج ملف PDF صالحاً', (tester) async {
    final employees = buildSampleEmployees();
    final organizationInfo = buildSampleOrganizationInfo();
    final service = ReportPrintService();

    final bytes = await service.buildDocument(
      reportType: ReportType.allEmployees,
      employees: employees,
      organizationInfo: organizationInfo,
    );

    _expectValidPdf(bytes);
  });

  testWidgets('طباعة تقرير بدون سجلات مطابقة لا تفشل وتنتج PDF صالحاً', (
    tester,
  ) async {
    final organizationInfo = buildSampleOrganizationInfo();
    final service = ReportPrintService();

    final bytes = await service.buildDocument(
      reportType: ReportType.byGender,
      employees: const [],
      organizationInfo: organizationInfo,
    );

    _expectValidPdf(bytes);
  });
}

void _expectValidPdf(Uint8List bytes) {
  expect(bytes, isNotEmpty);
  expect(bytes.length, greaterThan(1000));
  final header = String.fromCharCodes(bytes.take(5));
  expect(header, '%PDF-');
}
