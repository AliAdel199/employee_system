import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../core/utils/arabic_text_shaper.dart';
import '../../../employees/employees.dart';
import '../../../organization/organization.dart';
import '../../presentation/providers/report_providers.dart';

class ReportPrintService {
  Future<_PdfResources>? _resourcesFuture;

  Future<Uint8List> buildDocument({
    required ReportType reportType,
    required List<EmployeeModel> employees,
    required OrganizationInfoModel? organizationInfo,
    EmployeeModel? selectedEmployee,
    PdfPageFormat pageFormat = PdfPageFormat.a4,
  }) async {
    final resources = await _loadResources();
    final resolvedFormat = pageFormat.landscape;
    final logoImage = await _loadMemoryImage(organizationInfo?.logoPath ?? '');
    final employeeImage = reportType == ReportType.employeeForm
        ? await _loadMemoryImage(selectedEmployee?.photoPath ?? '')
        : null;
    final pdf = pw.Document(theme: resources.theme);

    if (reportType == ReportType.employeeForm) {
      final employee =
          selectedEmployee ?? (employees.isNotEmpty ? employees.first : null);
      if (employee == null) {
        throw StateError('لا يوجد موظف محدد لطباعة الاستمارة.');
      }

      pdf.addPage(
        pw.MultiPage(
          pageTheme: _buildPageTheme(resources, resolvedFormat),
          header: (context) => _buildHeader(
            resources: resources,
            organizationInfo: organizationInfo,
            logoImage: logoImage,
            title: 'استمارة بيانات موظف',
            subtitle: employee.fullName.trim().isEmpty
                ? 'سجل موظف'
                : employee.fullName.trim(),
          ),
          footer: (context) => _buildFooter(
            resources: resources,
            organizationInfo: organizationInfo,
            context: context,
          ),
          build: (context) {
            return [
              pw.Directionality(
                textDirection: pw.TextDirection.rtl,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  children: [
                    _buildEmployeeIdentityBanner(
                      resources: resources,
                      employee: employee,
                      employeeImage: employeeImage,
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Expanded(
                          child: _buildEmployeeSection(
                            resources: resources,
                            title: 'المعلومات الشخصية',
                            fields: [
                              _PdfField(
                                'الاسم الرباعي',
                                _text(employee.fullName),
                              ),
                              _PdfField(
                                'الجنس',
                                employee.gender?.label ?? 'غير محدد',
                              ),
                              _PdfField(
                                'تاريخ الولادة',
                                _formatDate(employee.birthDate),
                              ),
                              _PdfField(
                                'محل الولادة',
                                _text(employee.birthPlace),
                              ),
                              _PdfField(
                                'الحالة الاجتماعية',
                                employee.maritalStatus?.label ?? 'غير محدد',
                              ),
                              _PdfField(
                                'رقم الهاتف',
                                _text(employee.phoneNumber),
                              ),
                              _PdfField(
                                'التحصيل الدراسي',
                                employee.educationLevel?.label ?? 'غير محدد',
                              ),
                              _PdfField('العنوان', _text(employee.address)),
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Expanded(
                          child: _buildEmployeeSection(
                            resources: resources,
                            title: 'المستمسكات',
                            fields: [
                              _PdfField(
                                'الرقم الوطني',
                                _text(employee.nationalNumber),
                              ),
                              _PdfField(
                                'رقم البطاقة الوطنية',
                                _text(employee.nationalCardNumber),
                              ),
                              _PdfField(
                                'رقم بطاقة السكن',
                                _text(employee.housingCardNumber),
                              ),
                              _PdfField(
                                'تاريخ الإصدار',
                                _formatDate(employee.documentsIssueDate),
                              ),
                              _PdfField(
                                'جهة الإصدار',
                                _text(employee.documentsIssueAuthority),
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Expanded(
                          child: _buildEmployeeSection(
                            resources: resources,
                            title: 'المعلومات الوظيفية',
                            fields: [
                              _PdfField(
                                'الرقم الوظيفي',
                                _text(employee.employeeNumber),
                              ),
                              _PdfField(
                                'العنوان الوظيفي',
                                _text(employee.jobTitle),
                              ),
                              _PdfField(
                                'مكان العمل الحالي',
                                _text(employee.currentWorkplace),
                              ),
                              _PdfField(
                                'مكان العمل السابق',
                                _text(employee.previousWorkplace),
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Expanded(
                          child: _buildEmployeeSection(
                            resources: resources,
                            title: 'الملاحظات',
                            fields: [
                              _PdfField(
                                'ملاحظات وظيفية',
                                _text(employee.jobNotes),
                              ),
                              _PdfField(
                                'ملاحظات عامة',
                                _text(employee.generalNotes),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ];
          },
        ),
      );
    } else {
      pdf.addPage(
        pw.MultiPage(
          pageTheme: _buildPageTheme(resources, resolvedFormat),
          header: (context) => _buildHeader(
            resources: resources,
            organizationInfo: organizationInfo,
            logoImage: logoImage,
            title: _reportTitle(reportType),
            subtitle: reportType.description,
          ),
          footer: (context) => _buildFooter(
            resources: resources,
            organizationInfo: organizationInfo,
            context: context,
          ),
          build: (context) {
            return [
              pw.Directionality(
                textDirection: pw.TextDirection.rtl,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  children: [
                    _buildReportSummaryBanner(
                      resources: resources,
                      reportType: reportType,
                      employeesCount: employees.length,
                    ),
                    pw.SizedBox(height: 16),
                    if (employees.isEmpty)
                      _buildEmptyState(resources)
                    else
                      _buildEmployeesTable(
                        resources: resources,
                        employees: employees,
                      ),
                  ],
                ),
              ),
            ];
          },
        ),
      );
    }

    return pdf.save();
  }

  pw.PageTheme _buildPageTheme(
    _PdfResources resources,
    PdfPageFormat pageFormat,
  ) {
    return pw.PageTheme(
      pageFormat: pageFormat,
      margin: const pw.EdgeInsets.fromLTRB(28, 24, 28, 28),
      theme: resources.theme,
    );
  }

  pw.Widget _buildHeader({
    required _PdfResources resources,
    required OrganizationInfoModel? organizationInfo,
    required pw.MemoryImage? logoImage,
    required String title,
    required String subtitle,
  }) {
    final ministryName = _text(
      organizationInfo?.ministryName ?? '',
      fallback: 'اسم الوزارة غير محدد',
    );
    final organizationName = _text(
      organizationInfo?.organizationName ?? '',
      fallback: 'اسم المؤسسة غير محدد',
    );
    final branchDepartment = _ar(
      [
        if ((organizationInfo?.branchName ?? '').trim().isNotEmpty)
          organizationInfo!.branchName.trim(),
        if ((organizationInfo?.departmentName ?? '').trim().isNotEmpty)
          organizationInfo!.departmentName.trim(),
      ].join(' - '),
    );
    final contactLine = _ar(
      [
        if ((organizationInfo?.address ?? '').trim().isNotEmpty)
          organizationInfo!.address.trim(),
        if ((organizationInfo?.phoneNumber ?? '').trim().isNotEmpty)
          'هاتف: ${organizationInfo!.phoneNumber.trim()}',
        if ((organizationInfo?.email ?? '').trim().isNotEmpty)
          organizationInfo!.email.trim(),
      ].join('   |   '),
    );

    return pw.Directionality(
      textDirection: pw.TextDirection.rtl,
      child: pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 14),
        padding: const pw.EdgeInsets.only(bottom: 12),
        decoration: const pw.BoxDecoration(
          border: pw.Border(
            bottom: pw.BorderSide(color: PdfColors.blueGrey100, width: 1),
          ),
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text(
                        ministryName,
                        style: pw.TextStyle(
                          font: resources.boldFont,
                          fontSize: 15,
                          color: PdfColors.blueGrey900,
                        ),
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        organizationName,
                        style: pw.TextStyle(
                          font: resources.boldFont,
                          fontSize: 13,
                          color: _primaryColor,
                        ),
                        textAlign: pw.TextAlign.center,
                      ),
                      if (branchDepartment.isNotEmpty) ...[
                        pw.SizedBox(height: 4),
                        pw.Text(
                          branchDepartment,
                          style: pw.TextStyle(
                            font: resources.regularFont,
                            fontSize: 10,
                            color: PdfColors.grey700,
                          ),
                          textAlign: pw.TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
                pw.SizedBox(width: 16),
                _buildLogoFrame(logoImage),
              ],
            ),
            if (contactLine.isNotEmpty) ...[
              pw.SizedBox(height: 8),
              pw.Text(
                contactLine,
                style: pw.TextStyle(
                  font: resources.regularFont,
                  fontSize: 9,
                  color: PdfColors.grey700,
                ),
                textAlign: pw.TextAlign.center,
              ),
            ],
            pw.SizedBox(height: 12),
            pw.Container(
              padding: const pw.EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              decoration: pw.BoxDecoration(
                color: _primaryColor,
                borderRadius: pw.BorderRadius.circular(12),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(
                    _ar(title),
                    style: pw.TextStyle(
                      font: resources.boldFont,
                      fontSize: 14,
                      color: PdfColors.white,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    _ar(subtitle),
                    style: pw.TextStyle(
                      font: resources.regularFont,
                      fontSize: 9,
                      color: PdfColors.white,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  pw.Widget _buildFooter({
    required _PdfResources resources,
    required OrganizationInfoModel? organizationInfo,
    required pw.Context context,
  }) {
    final footerText = _text(
      organizationInfo?.reportsFooter ?? '',
      fallback: 'مستند صادر من نظام إدارة بيانات الموظفين.',
    );

    return pw.Directionality(
      textDirection: pw.TextDirection.rtl,
      child: pw.Container(
        padding: const pw.EdgeInsets.only(top: 8),
        decoration: const pw.BoxDecoration(
          border: pw.Border(
            top: pw.BorderSide(color: PdfColors.blueGrey100, width: 1),
          ),
        ),
        child: pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Text(
                footerText,
                style: pw.TextStyle(
                  font: resources.regularFont,
                  fontSize: 8,
                  color: PdfColors.grey700,
                ),
              ),
            ),
            pw.SizedBox(width: 12),
            pw.Text(
              _ar('صفحة ${context.pageNumber} / ${context.pagesCount}'),
              style: pw.TextStyle(
                font: resources.boldFont,
                fontSize: 8,
                color: PdfColors.grey700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  pw.Widget _buildReportSummaryBanner({
    required _PdfResources resources,
    required ReportType reportType,
    required int employeesCount,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(14),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(12),
        border: pw.Border.all(color: PdfColors.blueGrey100),
      ),
      child: pw.Row(
        children: [
          pw.Expanded(
            child: _buildSummaryItem(
              resources: resources,
              label: 'نوع التقرير',
              value: reportType.label,
            ),
          ),
          pw.SizedBox(width: 12),
          pw.Expanded(
            child: _buildSummaryItem(
              resources: resources,
              label: 'عدد السجلات',
              value: '$employeesCount',
            ),
          ),
          pw.SizedBox(width: 12),
          pw.Expanded(
            child: _buildSummaryItem(
              resources: resources,
              label: 'تاريخ الإنشاء',
              value: _formatDate(DateTime.now(), includeTime: true),
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildSummaryItem({
    required _PdfResources resources,
    required String label,
    required String value,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        color: PdfColors.white,
        borderRadius: pw.BorderRadius.circular(10),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            _ar(label),
            style: pw.TextStyle(
              font: resources.regularFont,
              fontSize: 8,
              color: PdfColors.grey700,
            ),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
            _ar(value),
            style: pw.TextStyle(
              font: resources.boldFont,
              fontSize: 10,
              color: PdfColors.blueGrey900,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildEmptyState(_PdfResources resources) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(12),
        border: pw.Border.all(color: PdfColors.blueGrey100),
      ),
      child: pw.Text(
        _ar('لا توجد سجلات مطابقة لإعدادات التقرير الحالية.'),
        style: pw.TextStyle(
          font: resources.boldFont,
          fontSize: 11,
          color: PdfColors.blueGrey900,
        ),
        textAlign: pw.TextAlign.center,
      ),
    );
  }

  pw.Widget _buildEmployeesTable({
    required _PdfResources resources,
    required List<EmployeeModel> employees,
  }) {
    return pw.TableHelper.fromTextArray(
      border: pw.TableBorder.all(color: PdfColors.blueGrey100, width: 0.6),
      cellAlignment: pw.Alignment.centerRight,
      headerAlignment: pw.Alignment.centerRight,
      headerDecoration: pw.BoxDecoration(color: _primaryColor),
      headerStyle: pw.TextStyle(
        font: resources.boldFont,
        fontSize: 8.5,
        color: PdfColors.white,
      ),
      cellStyle: pw.TextStyle(
        font: resources.regularFont,
        fontSize: 7.6,
        color: PdfColors.blueGrey900,
      ),
      oddRowDecoration: const pw.BoxDecoration(color: PdfColors.grey100),
      cellHeight: 24,
      headers: [
        '#',
        _ar('الاسم'),
        _ar('الرقم الوظيفي'),
        _ar('الرقم الوطني'),
        _ar('الجنس'),
        _ar('الحالة الاجتماعية'),
        _ar('التحصيل الدراسي'),
        _ar('العنوان الوظيفي'),
        _ar('مكان العمل'),
      ],
      columnWidths: const {
        0: pw.FixedColumnWidth(18),
        1: pw.FlexColumnWidth(2.2),
        2: pw.FlexColumnWidth(1.2),
        3: pw.FlexColumnWidth(1.5),
        4: pw.FlexColumnWidth(0.9),
        5: pw.FlexColumnWidth(1.1),
        6: pw.FlexColumnWidth(1.1),
        7: pw.FlexColumnWidth(1.5),
        8: pw.FlexColumnWidth(1.5),
      },
      data: List.generate(employees.length, (index) {
        final employee = employees[index];

        return [
          '${index + 1}',
          _text(employee.fullName, fallback: 'بدون اسم'),
          _text(employee.employeeNumber),
          _text(employee.nationalNumber),
          _ar(employee.gender?.label ?? 'غير محدد'),
          _ar(employee.maritalStatus?.label ?? 'غير محدد'),
          _ar(employee.educationLevel?.label ?? 'غير محدد'),
          _text(employee.jobTitle, fallback: 'غير محدد'),
          _text(employee.currentWorkplace, fallback: 'غير محدد'),
        ];
      }),
    );
  }

  pw.Widget _buildEmployeeIdentityBanner({
    required _PdfResources resources,
    required EmployeeModel employee,
    required pw.MemoryImage? employeeImage,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(10),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(12),
        border: pw.Border.all(color: PdfColors.blueGrey100),
      ),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  _text(employee.fullName, fallback: 'بدون اسم'),
                  style: pw.TextStyle(
                    font: resources.boldFont,
                    fontSize: 13,
                    color: PdfColors.blueGrey900,
                  ),
                ),
                pw.SizedBox(height: 6),
                pw.Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildMiniBadge(
                      resources: resources,
                      label: 'الرقم الوظيفي',
                      value: _text(employee.employeeNumber),
                    ),
                    _buildMiniBadge(
                      resources: resources,
                      label: 'العنوان الوظيفي',
                      value: _text(employee.jobTitle, fallback: 'غير محدد'),
                    ),
                    _buildMiniBadge(
                      resources: resources,
                      label: 'مكان العمل',
                      value: _text(
                        employee.currentWorkplace,
                        fallback: 'غير محدد',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          pw.SizedBox(width: 16),
          _buildEmployeePhotoFrame(employeeImage, resources),
        ],
      ),
    );
  }

  pw.Widget _buildMiniBadge({
    required _PdfResources resources,
    required String label,
    required String value,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: pw.BoxDecoration(
        color: PdfColors.white,
        borderRadius: pw.BorderRadius.circular(10),
      ),
      child: pw.Text(
        _ar('$label: $value'),
        style: pw.TextStyle(
          font: resources.regularFont,
          fontSize: 8.5,
          color: PdfColors.blueGrey900,
        ),
      ),
    );
  }

  pw.Widget _buildEmployeePhotoFrame(
    pw.MemoryImage? employeeImage,
    _PdfResources resources,
  ) {
    if (employeeImage == null) {
      return pw.Container(
        width: 72,
        height: 88,
        alignment: pw.Alignment.center,
        decoration: pw.BoxDecoration(
          color: PdfColors.white,
          borderRadius: pw.BorderRadius.circular(10),
          border: pw.Border.all(color: PdfColors.blueGrey100),
        ),
        child: pw.Text(
          _ar('بدون صورة'),
          style: pw.TextStyle(
            font: resources.boldFont,
            fontSize: 9,
            color: PdfColors.grey700,
          ),
          textAlign: pw.TextAlign.center,
        ),
      );
    }

    return pw.Container(
      width: 72,
      height: 88,
      decoration: pw.BoxDecoration(
        borderRadius: pw.BorderRadius.circular(10),
        border: pw.Border.all(color: PdfColors.blueGrey100),
        image: pw.DecorationImage(image: employeeImage, fit: pw.BoxFit.cover),
      ),
    );
  }

  pw.Widget _buildLogoFrame(pw.MemoryImage? logoImage) {
    if (logoImage == null) {
      return pw.Container(
        width: 64,
        height: 64,
        decoration: pw.BoxDecoration(
          borderRadius: pw.BorderRadius.circular(10),
          border: pw.Border.all(color: PdfColors.blueGrey100),
        ),
      );
    }

    return pw.Container(
      width: 64,
      height: 64,
      padding: const pw.EdgeInsets.all(6),
      decoration: pw.BoxDecoration(
        borderRadius: pw.BorderRadius.circular(10),
        border: pw.Border.all(color: PdfColors.blueGrey100),
      ),
      child: pw.Image(logoImage, fit: pw.BoxFit.contain),
    );
  }

  pw.Widget _buildEmployeeSection({
    required _PdfResources resources,
    required String title,
    required List<_PdfField> fields,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: pw.BoxDecoration(
            color: _secondaryColor,
            borderRadius: const pw.BorderRadius.only(
              topLeft: pw.Radius.circular(10),
              topRight: pw.Radius.circular(10),
            ),
          ),
          child: pw.Text(
            _ar(title),
            style: pw.TextStyle(
              font: resources.boldFont,
              fontSize: 10,
              color: _primaryColor,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: pw.BoxDecoration(
            color: PdfColors.white,
            borderRadius: const pw.BorderRadius.only(
              bottomLeft: pw.Radius.circular(10),
              bottomRight: pw.Radius.circular(10),
            ),
            border: pw.Border.all(color: PdfColors.blueGrey100),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: fields
                .map((field) => _buildCompactFieldRow(resources: resources, field: field))
                .toList(),
          ),
        ),
      ],
    );
  }

  pw.Widget _buildCompactFieldRow({
    required _PdfResources resources,
    required _PdfField field,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(vertical: 3),
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: PdfColors.grey200, width: 0.5),
        ),
      ),
      child: pw.RichText(
        text: pw.TextSpan(
          children: [
            pw.TextSpan(
              text: _ar('${field.label}: '),
              style: pw.TextStyle(
                font: resources.boldFont,
                fontSize: 8,
                color: PdfColors.grey700,
              ),
            ),
            pw.TextSpan(
              text: _ar(field.value),
              style: pw.TextStyle(
                font: resources.boldFont,
                fontSize: 9,
                color: PdfColors.blueGrey900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<_PdfResources> _loadResources() {
    return _resourcesFuture ??= _readResources();
  }

  Future<_PdfResources> _readResources() async {
    final regularData = await rootBundle.load('assets/fonts/Cairo-Regular.ttf');
    final boldData = await rootBundle.load('assets/fonts/Cairo-Bold.ttf');
    final regularFont = pw.Font.ttf(regularData);
    final boldFont = pw.Font.ttf(boldData);

    return _PdfResources(
      regularFont: regularFont,
      boldFont: boldFont,
      theme: pw.ThemeData.withFont(base: regularFont, bold: boldFont),
    );
  }

  Future<pw.MemoryImage?> _loadMemoryImage(String path) async {
    final normalizedPath = path.trim();
    if (normalizedPath.isEmpty) {
      return null;
    }

    final file = File(normalizedPath);
    if (!file.existsSync()) {
      return null;
    }

    try {
      return pw.MemoryImage(await file.readAsBytes());
    } catch (_) {
      return null;
    }
  }

  String _reportTitle(ReportType type) {
    switch (type) {
      case ReportType.allEmployees:
        return 'تقرير جميع الموظفين';
      case ReportType.byGender:
        return 'تقرير الموظفين حسب الجنس';
      case ReportType.byMaritalStatus:
        return 'تقرير الموظفين حسب الحالة الاجتماعية';
      case ReportType.byEducationLevel:
        return 'تقرير الموظفين حسب التحصيل الدراسي';
      case ReportType.byJobTitle:
        return 'تقرير الموظفين حسب العنوان الوظيفي';
      case ReportType.byWorkplace:
        return 'تقرير الموظفين حسب مكان العمل';
      case ReportType.employeeForm:
        return 'استمارة بيانات موظف';
    }
  }

  String _ar(String value) => shapeArabicText(value);

  String _text(String value, {String fallback = 'غير مسجل'}) {
    final normalized = value.trim();
    return shapeArabicText(normalized.isEmpty ? fallback : normalized);
  }

  String _formatDate(DateTime? date, {bool includeTime = false}) {
    if (date == null) {
      return 'غير مسجل';
    }

    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    if (!includeTime) {
      return '$day/$month/$year';
    }

    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day/$month/$year - $hour:$minute';
  }
}

class _PdfResources {
  const _PdfResources({
    required this.regularFont,
    required this.boldFont,
    required this.theme,
  });

  final pw.Font regularFont;
  final pw.Font boldFont;
  final pw.ThemeData theme;
}

class _PdfField {
  const _PdfField(this.label, this.value);

  final String label;
  final String value;
}

final PdfColor _primaryColor = PdfColor.fromInt(0xFF133A67);
final PdfColor _secondaryColor = PdfColor.fromInt(0xFFDCE7F2);
