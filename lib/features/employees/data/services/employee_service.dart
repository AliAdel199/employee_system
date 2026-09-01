import 'package:isar/isar.dart';

import '../../../../core/database/app_database.dart';
import '../models/employee_model.dart';

abstract class EmployeeService {
  const EmployeeService();

  Future<List<EmployeeModel>> getEmployees({
    EmployeeFilter filter = const EmployeeFilter(),
    int? limit,
  });

  Stream<List<EmployeeModel>> watchEmployees({
    EmployeeFilter filter = const EmployeeFilter(),
    int? limit,
  });

  Future<EmployeeModel?> getEmployeeById(Id id);

  Future<EmployeeModel> saveEmployee(EmployeeModel employee);

  Future<bool> deleteEmployee(Id id);

  Future<List<EmployeeModel>> getRecentEmployees({int limit = 5});

  Future<EmployeeStatistics> getStatistics();

  Future<List<String>> getJobTitles();

  Future<List<String>> getCurrentWorkplaces();

  Future<bool> existsByNationalNumber(String nationalNumber, {Id? excludeId});

  Future<bool> existsByEmployeeNumber(String employeeNumber, {Id? excludeId});
}

class IsarEmployeeService implements EmployeeService {
  const IsarEmployeeService();

  @override
  Future<List<EmployeeModel>> getEmployees({
    EmployeeFilter filter = const EmployeeFilter(),
    int? limit,
  }) async {
    final isar = await AppDatabase.open();
    final query = _buildEmployeesQuery(isar, filter);

    if (limit != null) {
      return query.limit(limit).findAll();
    }

    return query.findAll();
  }

  @override
  Stream<List<EmployeeModel>> watchEmployees({
    EmployeeFilter filter = const EmployeeFilter(),
    int? limit,
  }) async* {
    final isar = await AppDatabase.open();
    final query = _buildEmployeesQuery(isar, filter);

    if (limit != null) {
      yield* query.limit(limit).watch(fireImmediately: true);
      return;
    }

    yield* query.watch(fireImmediately: true);
  }

  @override
  Future<EmployeeModel?> getEmployeeById(Id id) async {
    final isar = await AppDatabase.open();
    return isar.employeeModels.get(id);
  }

  @override
  Future<EmployeeModel> saveEmployee(EmployeeModel employee) async {
    final isar = await AppDatabase.open();
    final now = DateTime.now();
    final isNewEmployee = employee.id == Isar.autoIncrement;

    if (isNewEmployee) {
      employee.createdAt = now;
    }

    employee.updatedAt = now;

    await isar.writeTxn(() async {
      await isar.employeeModels.put(employee);
    });

    return employee;
  }

  @override
  Future<bool> deleteEmployee(Id id) async {
    final isar = await AppDatabase.open();

    return isar.writeTxn(() async {
      return isar.employeeModels.delete(id);
    });
  }

  @override
  Future<List<EmployeeModel>> getRecentEmployees({int limit = 5}) {
    return getEmployees(limit: limit);
  }

  @override
  Future<EmployeeStatistics> getStatistics() async {
    final isar = await AppDatabase.open();

    final totalCount = await isar.employeeModels.where().count();
    final maleCount = await isar.employeeModels
        .filter()
        .genderEqualTo(Gender.male)
        .count();
    final femaleCount = await isar.employeeModels
        .filter()
        .genderEqualTo(Gender.female)
        .count();

    return EmployeeStatistics(
      totalCount: totalCount,
      maleCount: maleCount,
      femaleCount: femaleCount,
    );
  }

  @override
  Future<List<String>> getJobTitles() async {
    final isar = await AppDatabase.open();
    final values = await isar.employeeModels
        .where()
        .jobTitleProperty()
        .findAll();

    return _distinctNonEmptyValues(values);
  }

  @override
  Future<List<String>> getCurrentWorkplaces() async {
    final isar = await AppDatabase.open();
    final values = await isar.employeeModels
        .where()
        .currentWorkplaceProperty()
        .findAll();

    return _distinctNonEmptyValues(values);
  }

  @override
  Future<bool> existsByNationalNumber(
    String nationalNumber, {
    Id? excludeId,
  }) async {
    final normalizedValue = nationalNumber.trim();
    if (normalizedValue.isEmpty) {
      return false;
    }

    final isar = await AppDatabase.open();
    final matches = await isar.employeeModels
        .filter()
        .nationalNumberEqualTo(normalizedValue)
        .findAll();

    return matches.any((employee) => employee.id != excludeId);
  }

  @override
  Future<bool> existsByEmployeeNumber(
    String employeeNumber, {
    Id? excludeId,
  }) async {
    final normalizedValue = employeeNumber.trim();
    if (normalizedValue.isEmpty) {
      return false;
    }

    final isar = await AppDatabase.open();
    final matches = await isar.employeeModels
        .filter()
        .employeeNumberEqualTo(normalizedValue)
        .findAll();

    return matches.any((employee) => employee.id != excludeId);
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
  _applyEmployeeFilter(
    QueryBuilder<EmployeeModel, EmployeeModel, QFilterCondition> query,
    EmployeeFilter filter,
  ) {
    return query
        .optional(
          filter.hasSearchText,
          (q) => q.group(
            (q) => q
                .fullNameContains(
                  filter.normalizedSearchText,
                  caseSensitive: false,
                )
                .or()
                .nationalNumberContains(
                  filter.normalizedSearchText,
                  caseSensitive: false,
                )
                .or()
                .employeeNumberContains(
                  filter.normalizedSearchText,
                  caseSensitive: false,
                )
                .or()
                .phoneNumberContains(
                  filter.normalizedSearchText,
                  caseSensitive: false,
                )
                .or()
                .jobTitleContains(
                  filter.normalizedSearchText,
                  caseSensitive: false,
                )
                .or()
                .currentWorkplaceContains(
                  filter.normalizedSearchText,
                  caseSensitive: false,
                ),
          ),
        )
        .optional(filter.gender != null, (q) => q.genderEqualTo(filter.gender))
        .optional(
          filter.maritalStatus != null,
          (q) => q.maritalStatusEqualTo(filter.maritalStatus),
        )
        .optional(
          filter.educationLevel != null,
          (q) => q.educationLevelEqualTo(filter.educationLevel),
        )
        .optional(
          filter.hasJobTitle,
          (q) => q.jobTitleEqualTo(
            filter.normalizedJobTitle,
            caseSensitive: false,
          ),
        )
        .optional(
          filter.hasCurrentWorkplace,
          (q) => q.currentWorkplaceEqualTo(
            filter.normalizedCurrentWorkplace,
            caseSensitive: false,
          ),
        );
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> _buildEmployeesQuery(
    Isar isar,
    EmployeeFilter filter,
  ) {
    return _applyEmployeeFilter(
      isar.employeeModels.filter(),
      filter,
    ).sortByCreatedAtDesc().thenByFullName();
  }

  List<String> _distinctNonEmptyValues(List<String> values) {
    final normalizedValues =
        values
            .map((value) => value.trim())
            .where((value) => value.isNotEmpty)
            .toSet()
            .toList()
          ..sort();

    return normalizedValues;
  }
}

class EmployeeFilter {
  const EmployeeFilter({
    this.searchText = '',
    this.gender,
    this.maritalStatus,
    this.educationLevel,
    this.jobTitle,
    this.currentWorkplace,
  });

  final String searchText;
  final Gender? gender;
  final MaritalStatus? maritalStatus;
  final EducationLevel? educationLevel;
  final String? jobTitle;
  final String? currentWorkplace;

  bool get hasSearchText => normalizedSearchText.isNotEmpty;
  String get normalizedSearchText => searchText.trim();

  bool get hasJobTitle => normalizedJobTitle.isNotEmpty;
  String get normalizedJobTitle => (jobTitle ?? '').trim();

  bool get hasCurrentWorkplace => normalizedCurrentWorkplace.isNotEmpty;
  String get normalizedCurrentWorkplace => (currentWorkplace ?? '').trim();

  EmployeeFilter copyWith({
    String? searchText,
    Gender? gender,
    MaritalStatus? maritalStatus,
    EducationLevel? educationLevel,
    String? jobTitle,
    String? currentWorkplace,
    bool clearGender = false,
    bool clearMaritalStatus = false,
    bool clearEducationLevel = false,
  }) {
    return EmployeeFilter(
      searchText: searchText ?? this.searchText,
      gender: clearGender ? null : (gender ?? this.gender),
      maritalStatus: clearMaritalStatus
          ? null
          : (maritalStatus ?? this.maritalStatus),
      educationLevel: clearEducationLevel
          ? null
          : (educationLevel ?? this.educationLevel),
      jobTitle: jobTitle ?? this.jobTitle,
      currentWorkplace: currentWorkplace ?? this.currentWorkplace,
    );
  }
}

class EmployeeStatistics {
  const EmployeeStatistics({
    required this.totalCount,
    required this.maleCount,
    required this.femaleCount,
  });

  final int totalCount;
  final int maleCount;
  final int femaleCount;
}
