import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../employees/employees.dart';
import '../../../organization/organization.dart';

enum ReportType {
  allEmployees,
  byGender,
  byMaritalStatus,
  byEducationLevel,
  byJobTitle,
  byWorkplace,
  employeeForm,
}

extension ReportTypeX on ReportType {
  String get label {
    switch (this) {
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

  String get description {
    switch (this) {
      case ReportType.allEmployees:
        return 'عرض جميع الموظفين المسجلين في النظام.';
      case ReportType.byGender:
        return 'تصفية الموظفين حسب الذكور أو الإناث.';
      case ReportType.byMaritalStatus:
        return 'تجميع الموظفين بحسب الحالة الاجتماعية.';
      case ReportType.byEducationLevel:
        return 'عرض الموظفين حسب التحصيل الدراسي.';
      case ReportType.byJobTitle:
        return 'تصفية السجلات حسب العنوان الوظيفي.';
      case ReportType.byWorkplace:
        return 'تصفية السجلات حسب مكان العمل الحالي.';
      case ReportType.employeeForm:
        return 'معاينة استمارة موظف واحد بالتفصيل.';
    }
  }
}

class ReportFilterState {
  const ReportFilterState({
    this.type = ReportType.allEmployees,
    this.gender,
    this.maritalStatus,
    this.educationLevel,
    this.jobTitle,
    this.currentWorkplace,
    this.employeeId,
  });

  final ReportType type;
  final Gender? gender;
  final MaritalStatus? maritalStatus;
  final EducationLevel? educationLevel;
  final String? jobTitle;
  final String? currentWorkplace;
  final int? employeeId;

  bool get hasJobTitle => (jobTitle ?? '').trim().isNotEmpty;
  bool get hasCurrentWorkplace => (currentWorkplace ?? '').trim().isNotEmpty;

  ReportFilterState copyWith({
    ReportType? type,
    Gender? gender,
    MaritalStatus? maritalStatus,
    EducationLevel? educationLevel,
    String? jobTitle,
    String? currentWorkplace,
    int? employeeId,
    bool clearGender = false,
    bool clearMaritalStatus = false,
    bool clearEducationLevel = false,
    bool clearJobTitle = false,
    bool clearCurrentWorkplace = false,
    bool clearEmployeeId = false,
  }) {
    return ReportFilterState(
      type: type ?? this.type,
      gender: clearGender ? null : (gender ?? this.gender),
      maritalStatus: clearMaritalStatus
          ? null
          : (maritalStatus ?? this.maritalStatus),
      educationLevel: clearEducationLevel
          ? null
          : (educationLevel ?? this.educationLevel),
      jobTitle: clearJobTitle ? null : (jobTitle ?? this.jobTitle),
      currentWorkplace: clearCurrentWorkplace
          ? null
          : (currentWorkplace ?? this.currentWorkplace),
      employeeId: clearEmployeeId ? null : (employeeId ?? this.employeeId),
    );
  }
}

final reportFilterProvider =
    NotifierProvider<ReportFilterNotifier, ReportFilterState>(
      ReportFilterNotifier.new,
    );

final filteredReportEmployeesProvider =
    Provider<AsyncValue<List<EmployeeModel>>>((ref) {
      final employeesAsync = ref.watch(allEmployeesProvider);
      final filter = ref.watch(reportFilterProvider);

      return employeesAsync.whenData(
        (employees) => employees.where((employee) {
          switch (filter.type) {
            case ReportType.allEmployees:
              return true;
            case ReportType.byGender:
              return filter.gender == null || employee.gender == filter.gender;
            case ReportType.byMaritalStatus:
              return filter.maritalStatus == null ||
                  employee.maritalStatus == filter.maritalStatus;
            case ReportType.byEducationLevel:
              return filter.educationLevel == null ||
                  employee.educationLevel == filter.educationLevel;
            case ReportType.byJobTitle:
              return !filter.hasJobTitle ||
                  employee.jobTitle.trim() == filter.jobTitle?.trim();
            case ReportType.byWorkplace:
              return !filter.hasCurrentWorkplace ||
                  employee.currentWorkplace.trim() ==
                      filter.currentWorkplace?.trim();
            case ReportType.employeeForm:
              return filter.employeeId == null ||
                  employee.id == filter.employeeId;
          }
        }).toList(),
      );
    });

final selectedReportEmployeeProvider = Provider<AsyncValue<EmployeeModel?>>((
  ref,
) {
  final employeesAsync = ref.watch(filteredReportEmployeesProvider);
  final filter = ref.watch(reportFilterProvider);

  return employeesAsync.whenData((employees) {
    if (filter.type != ReportType.employeeForm) {
      return null;
    }

    return employees.isEmpty ? null : employees.first;
  });
});

final reportOrganizationInfoProvider =
    Provider<AsyncValue<OrganizationInfoModel?>>((ref) {
      return ref.watch(organizationInfoProvider);
    });

class ReportFilterNotifier extends Notifier<ReportFilterState> {
  @override
  ReportFilterState build() {
    return const ReportFilterState();
  }

  void setType(ReportType type) {
    state = ReportFilterState(type: type);
  }

  void setGender(Gender? value) {
    state = value == null
        ? state.copyWith(clearGender: true)
        : state.copyWith(gender: value);
  }

  void setMaritalStatus(MaritalStatus? value) {
    state = value == null
        ? state.copyWith(clearMaritalStatus: true)
        : state.copyWith(maritalStatus: value);
  }

  void setEducationLevel(EducationLevel? value) {
    state = value == null
        ? state.copyWith(clearEducationLevel: true)
        : state.copyWith(educationLevel: value);
  }

  void setJobTitle(String? value) {
    state = value == null || value.trim().isEmpty
        ? state.copyWith(clearJobTitle: true)
        : state.copyWith(jobTitle: value);
  }

  void setCurrentWorkplace(String? value) {
    state = value == null || value.trim().isEmpty
        ? state.copyWith(clearCurrentWorkplace: true)
        : state.copyWith(currentWorkplace: value);
  }

  void setEmployeeId(int? value) {
    state = value == null
        ? state.copyWith(clearEmployeeId: true)
        : state.copyWith(employeeId: value);
  }
}
