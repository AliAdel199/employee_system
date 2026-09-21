// اختبار مساعد يولّد ملفات PDF حقيقية من نفس مسار الطباعة المستخدم في
// التطبيق، بهدف المعاينة اليدوية للتأكد من صحة إخراج الطباعة الفعلي.
import 'dart:io';

import 'package:employee_system/features/reports/application/services/report_print_service.dart';
import 'package:employee_system/features/reports/presentation/providers/report_providers.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/sample_data.dart';

void main() {
  testWidgets(
    'توليد نماذج PDF فعلية للمعاينة اليدوية',
    (tester) async {
      await tester.runAsync(() async {
        final employees = buildSampleEmployees();
        final organizationInfo = buildSampleOrganizationInfo();
        final service = ReportPrintService();

        final employeeFormBytes = await service.buildDocument(
          reportType: ReportType.employeeForm,
          employees: employees,
          organizationInfo: organizationInfo,
          selectedEmployee: employees.first,
        );
        await File('sample_employee_form.pdf').writeAsBytes(employeeFormBytes);

        final allEmployeesBytes = await service.buildDocument(
          reportType: ReportType.allEmployees,
          employees: employees,
          organizationInfo: organizationInfo,
        );
        await File(
          'sample_all_employees_report.pdf',
        ).writeAsBytes(allEmployeesBytes);
      });

      expect(File('sample_employee_form.pdf').existsSync(), isTrue);
      expect(File('sample_all_employees_report.pdf').existsSync(), isTrue);
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}
