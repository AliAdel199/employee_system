import 'package:isar/isar.dart';

part 'employee_model.g.dart';

@collection
class EmployeeModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value, caseSensitive: false)
  String fullName = '';

  @Enumerated(EnumType.name)
  Gender? gender;

  DateTime? birthDate;
  String birthPlace = '';

  @Enumerated(EnumType.name)
  MaritalStatus? maritalStatus;

  @Index(type: IndexType.value)
  String phoneNumber = '';

  @Enumerated(EnumType.name)
  EducationLevel? educationLevel;

  String address = '';
  String photoPath = '';

  @Index(type: IndexType.value)
  String nationalNumber = '';

  @Index(type: IndexType.value)
  String nationalCardNumber = '';

  @Index(type: IndexType.value)
  String housingCardNumber = '';

  DateTime? documentsIssueDate;
  String documentsIssueAuthority = '';

  @Index(type: IndexType.value)
  String employeeNumber = '';

  @Index(type: IndexType.value, caseSensitive: false)
  String jobTitle = '';

  @Index(type: IndexType.value, caseSensitive: false)
  String currentWorkplace = '';

  @Index(type: IndexType.value, caseSensitive: false)
  String previousWorkplace = '';

  String jobNotes = '';
  String generalNotes = '';

  @Index()
  DateTime createdAt = DateTime.now();

  DateTime updatedAt = DateTime.now();
}

enum Gender { male, female }

enum MaritalStatus { single, married, divorced, widowed }

enum EducationLevel {
  primary,
  intermediate,
  secondary,
  diploma,
  bachelor,
  master,
  doctorate,
  other,
}

extension GenderX on Gender {
  String get label {
    switch (this) {
      case Gender.male:
        return 'ذكر';
      case Gender.female:
        return 'أنثى';
    }
  }
}

extension MaritalStatusX on MaritalStatus {
  String get label {
    switch (this) {
      case MaritalStatus.single:
        return 'أعزب';
      case MaritalStatus.married:
        return 'متزوج';
      case MaritalStatus.divorced:
        return 'مطلق';
      case MaritalStatus.widowed:
        return 'أرمل';
    }
  }
}

extension EducationLevelX on EducationLevel {
  String get label {
    switch (this) {
      case EducationLevel.primary:
        return 'ابتدائية';
      case EducationLevel.intermediate:
        return 'متوسطة';
      case EducationLevel.secondary:
        return 'إعدادية';
      case EducationLevel.diploma:
        return 'دبلوم';
      case EducationLevel.bachelor:
        return 'بكالوريوس';
      case EducationLevel.master:
        return 'ماجستير';
      case EducationLevel.doctorate:
        return 'دكتوراه';
      case EducationLevel.other:
        return 'أخرى';
    }
  }
}
