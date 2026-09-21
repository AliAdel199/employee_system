import 'dart:typed_data';

import 'package:excel/excel.dart';

import '../../../employees/employees.dart';
import '../../presentation/providers/report_providers.dart';

class ReportExcelService {
  const ReportExcelService();

  Uint8List buildWorkbook({
    required ReportType reportType,
    required List<EmployeeModel> employees,
    EmployeeModel? selectedEmployee,
  }) {
    final excel = Excel.createExcel();
    final defaultSheetName = excel.getDefaultSheet() ?? 'Sheet1';
    final sheetName = _sheetTitle(reportType);

    excel.rename(defaultSheetName, sheetName);
    final sheet = excel[sheetName];
    sheet.isRTL = true;

    if (reportType == ReportType.employeeForm) {
      final employee =
          selectedEmployee ?? (employees.isNotEmpty ? employees.first : null);
      if (employee == null) {
        throw StateError('لا يوجد موظف محدد لتصدير استمارته.');
      }
      _buildEmployeeFormSheet(sheet, employee);
    } else {
      _buildEmployeesTableSheet(sheet, employees);
    }

    final bytes = excel.save();
    if (bytes == null) {
      throw StateError('تعذر إنشاء ملف Excel.');
    }
    return Uint8List.fromList(bytes);
  }

  void _buildEmployeesTableSheet(Sheet sheet, List<EmployeeModel> employees) {
    const headers = [
      'الاسم',
      'الرقم الوظيفي',
      'الرقم الوطني',
      'الهاتف',
      'الجنس',
      'الحالة الاجتماعية',
      'التحصيل الدراسي',
      'العنوان الوظيفي',
      'مكان العمل الحالي',
      'مكان العمل السابق',
      'تاريخ الميلاد',
      'محل الميلاد',
      'العنوان',
      'رقم البطاقة الوطنية',
      'رقم بطاقة السكن',
      'تاريخ إصدار المستمسكات',
      'جهة الإصدار',
      'ملاحظات وظيفية',
      'ملاحظات عامة',
    ];

    sheet.appendRow(headers.map(TextCellValue.new).toList());

    for (final employee in employees) {
      sheet.appendRow([
        TextCellValue(_text(employee.fullName)),
        TextCellValue(_text(employee.employeeNumber)),
        TextCellValue(_text(employee.nationalNumber)),
        TextCellValue(_text(employee.phoneNumber)),
        TextCellValue(employee.gender?.label ?? 'غير محدد'),
        TextCellValue(employee.maritalStatus?.label ?? 'غير محدد'),
        TextCellValue(employee.educationLevel?.label ?? 'غير محدد'),
        TextCellValue(_text(employee.jobTitle)),
        TextCellValue(_text(employee.currentWorkplace)),
        TextCellValue(_text(employee.previousWorkplace)),
        TextCellValue(_formatDate(employee.birthDate)),
        TextCellValue(_text(employee.birthPlace)),
        TextCellValue(_text(employee.address)),
        TextCellValue(_text(employee.nationalCardNumber)),
        TextCellValue(_text(employee.housingCardNumber)),
        TextCellValue(_formatDate(employee.documentsIssueDate)),
        TextCellValue(_text(employee.documentsIssueAuthority)),
        TextCellValue(_text(employee.jobNotes)),
        TextCellValue(_text(employee.generalNotes)),
      ]);
    }

    for (var i = 0; i < headers.length; i++) {
      sheet.setColumnWidth(i, 20);
    }
  }

  void _buildEmployeeFormSheet(Sheet sheet, EmployeeModel employee) {
    sheet.appendRow([TextCellValue('الحقل'), TextCellValue('القيمة')]);

    final fields = <String, String>{
      'الاسم': _text(employee.fullName),
      'الجنس': employee.gender?.label ?? 'غير محدد',
      'تاريخ الولادة': _formatDate(employee.birthDate),
      'محل الولادة': _text(employee.birthPlace),
      'الحالة الاجتماعية': employee.maritalStatus?.label ?? 'غير محدد',
      'رقم الهاتف': _text(employee.phoneNumber),
      'التحصيل الدراسي': employee.educationLevel?.label ?? 'غير محدد',
      'العنوان': _text(employee.address),
      'الرقم الوطني': _text(employee.nationalNumber),
      'رقم البطاقة الوطنية': _text(employee.nationalCardNumber),
      'رقم بطاقة السكن': _text(employee.housingCardNumber),
      'تاريخ إصدار المستمسكات': _formatDate(employee.documentsIssueDate),
      'جهة الإصدار': _text(employee.documentsIssueAuthority),
      'الرقم الوظيفي': _text(employee.employeeNumber),
      'العنوان الوظيفي': _text(employee.jobTitle),
      'مكان العمل الحالي': _text(employee.currentWorkplace),
      'مكان العمل السابق': _text(employee.previousWorkplace),
      'ملاحظات وظيفية': _text(employee.jobNotes),
      'ملاحظات عامة': _text(employee.generalNotes),
    };

    fields.forEach((label, value) {
      sheet.appendRow([TextCellValue(label), TextCellValue(value)]);
    });

    sheet.setColumnWidth(0, 26);
    sheet.setColumnWidth(1, 40);
  }

  String _sheetTitle(ReportType reportType) {
    switch (reportType) {
      case ReportType.allEmployees:
        return 'جميع الموظفين';
      case ReportType.byGender:
        return 'حسب الجنس';
      case ReportType.byMaritalStatus:
        return 'حسب الحالة الاجتماعية';
      case ReportType.byEducationLevel:
        return 'حسب التحصيل الدراسي';
      case ReportType.byJobTitle:
        return 'حسب العنوان الوظيفي';
      case ReportType.byWorkplace:
        return 'حسب مكان العمل';
      case ReportType.employeeForm:
        return 'استمارة موظف';
    }
  }

  String _text(String value) {
    final normalized = value.trim();
    return normalized.isEmpty ? 'غير مسجل' : normalized;
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'غير مسجل';
    }
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day/$month/$year';
  }
}
