import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

import '../../../../core/database/database_paths.dart';
import '../../../employees/employees.dart';

class ImportSummary {
  const ImportSummary({
    required this.added,
    required this.updated,
    required this.skipped,
    required this.failed,
  });

  final int added;
  final int updated;
  final int skipped;
  final int failed;

  int get total => added + updated + skipped + failed;
}

class EmployeeTransferService {
  const EmployeeTransferService();

  /// يصدّر قائمة الموظفين إلى نص JSON، مع تضمين الصور كـ base64 داخل نفس
  /// الملف حتى يبقى قابلاً للنقل بالكامل إلى جهاز آخر دون ملفات إضافية.
  Future<String> exportToJson(List<EmployeeModel> employees) async {
    final items = <Map<String, dynamic>>[];

    for (final employee in employees) {
      items.add(await _employeeToJson(employee));
    }

    final envelope = {
      'formatVersion': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'employees': items,
    };

    return const JsonEncoder.withIndent('  ').convert(envelope);
  }

  /// يستورد الموظفين من نص JSON ويدمجهم مع البيانات الحالية عبر
  /// [employeeService]. عند تطابق الرقم الوطني (أو الرقم الوظيفي كبديل):
  /// - إن كان السجل المستورد أحدث تعديلاً (updatedAt) من السجل المحلي، يحل
  ///   محله.
  /// - وإلا يُتجاهل ويبقى السجل المحلي كما هو.
  Future<ImportSummary> importFromJson(
    String jsonContent,
    EmployeeService employeeService,
  ) async {
    final decoded = jsonDecode(jsonContent);
    if (decoded is! Map<String, dynamic> || decoded['employees'] is! List) {
      throw const FormatException('صيغة ملف الاستيراد غير صحيحة.');
    }

    final items = (decoded['employees'] as List).cast<Map<String, dynamic>>();

    var added = 0;
    var updated = 0;
    var skipped = 0;
    var failed = 0;

    for (final item in items) {
      try {
        final incoming = await _employeeFromJson(item);

        EmployeeModel? existing;
        if (incoming.nationalNumber.trim().isNotEmpty) {
          existing = await employeeService.getEmployeeByNationalNumber(
            incoming.nationalNumber,
          );
        }
        existing ??= incoming.employeeNumber.trim().isNotEmpty
            ? await employeeService.getEmployeeByEmployeeNumber(
                incoming.employeeNumber,
              )
            : null;

        if (existing == null) {
          await employeeService.saveEmployee(incoming);
          added++;
        } else if (incoming.updatedAt.isAfter(existing.updatedAt)) {
          incoming
            ..id = existing.id
            ..createdAt = existing.createdAt;
          await employeeService.saveEmployee(incoming);
          updated++;
        } else {
          skipped++;
        }
      } catch (_) {
        failed++;
      }
    }

    return ImportSummary(
      added: added,
      updated: updated,
      skipped: skipped,
      failed: failed,
    );
  }

  Future<Map<String, dynamic>> _employeeToJson(EmployeeModel employee) async {
    String? photoBase64;
    String? photoExtension;

    if (employee.photoPath.trim().isNotEmpty) {
      final file = File(employee.photoPath);
      if (await file.exists()) {
        photoBase64 = base64Encode(await file.readAsBytes());
        photoExtension = p
            .extension(employee.photoPath)
            .replaceFirst('.', '');
      }
    }

    return {
      'fullName': employee.fullName,
      'gender': employee.gender?.name,
      'birthDate': employee.birthDate?.toIso8601String(),
      'birthPlace': employee.birthPlace,
      'maritalStatus': employee.maritalStatus?.name,
      'phoneNumber': employee.phoneNumber,
      'educationLevel': employee.educationLevel?.name,
      'address': employee.address,
      'photoBase64': photoBase64,
      'photoExtension': photoExtension,
      'nationalNumber': employee.nationalNumber,
      'nationalCardNumber': employee.nationalCardNumber,
      'housingCardNumber': employee.housingCardNumber,
      'documentsIssueDate': employee.documentsIssueDate?.toIso8601String(),
      'documentsIssueAuthority': employee.documentsIssueAuthority,
      'employeeNumber': employee.employeeNumber,
      'jobTitle': employee.jobTitle,
      'currentWorkplace': employee.currentWorkplace,
      'previousWorkplace': employee.previousWorkplace,
      'jobNotes': employee.jobNotes,
      'generalNotes': employee.generalNotes,
      'createdAt': employee.createdAt.toIso8601String(),
      'updatedAt': employee.updatedAt.toIso8601String(),
    };
  }

  Future<EmployeeModel> _employeeFromJson(Map<String, dynamic> json) async {
    final employee = EmployeeModel()
      ..fullName = (json['fullName'] as String?) ?? ''
      ..gender = _enumFromName(Gender.values, json['gender'] as String?)
      ..birthDate = _dateFromJson(json['birthDate'])
      ..birthPlace = (json['birthPlace'] as String?) ?? ''
      ..maritalStatus = _enumFromName(
        MaritalStatus.values,
        json['maritalStatus'] as String?,
      )
      ..phoneNumber = (json['phoneNumber'] as String?) ?? ''
      ..educationLevel = _enumFromName(
        EducationLevel.values,
        json['educationLevel'] as String?,
      )
      ..address = (json['address'] as String?) ?? ''
      ..nationalNumber = (json['nationalNumber'] as String?) ?? ''
      ..nationalCardNumber = (json['nationalCardNumber'] as String?) ?? ''
      ..housingCardNumber = (json['housingCardNumber'] as String?) ?? ''
      ..documentsIssueDate = _dateFromJson(json['documentsIssueDate'])
      ..documentsIssueAuthority =
          (json['documentsIssueAuthority'] as String?) ?? ''
      ..employeeNumber = (json['employeeNumber'] as String?) ?? ''
      ..jobTitle = (json['jobTitle'] as String?) ?? ''
      ..currentWorkplace = (json['currentWorkplace'] as String?) ?? ''
      ..previousWorkplace = (json['previousWorkplace'] as String?) ?? ''
      ..jobNotes = (json['jobNotes'] as String?) ?? ''
      ..generalNotes = (json['generalNotes'] as String?) ?? ''
      ..createdAt = _dateFromJson(json['createdAt']) ?? DateTime.now()
      ..updatedAt = _dateFromJson(json['updatedAt']) ?? DateTime.now();

    final photoBase64 = json['photoBase64'] as String?;
    if (photoBase64 != null && photoBase64.isNotEmpty) {
      employee.photoPath = await _savePhotoFile(
        photoBase64,
        (json['photoExtension'] as String?) ?? 'png',
        employee.nationalNumber,
      );
    }

    return employee;
  }

  Future<String> _savePhotoFile(
    String base64Content,
    String extension,
    String identifierHint,
  ) async {
    final photosDirectory = await DatabasePaths.ensurePhotosDirectory();
    final safeIdentifier = identifierHint.trim().isNotEmpty
        ? identifierHint.trim()
        : DateTime.now().microsecondsSinceEpoch.toString();
    final fileName =
        '${safeIdentifier}_${DateTime.now().microsecondsSinceEpoch}.$extension';
    final file = File(p.join(photosDirectory.path, fileName));
    await file.writeAsBytes(base64Decode(base64Content));
    return file.path;
  }

  T? _enumFromName<T extends Enum>(List<T> values, String? name) {
    if (name == null) {
      return null;
    }
    for (final value in values) {
      if (value.name == name) {
        return value;
      }
    }
    return null;
  }

  DateTime? _dateFromJson(dynamic value) {
    if (value is String && value.isNotEmpty) {
      return DateTime.tryParse(value);
    }
    return null;
  }
}
