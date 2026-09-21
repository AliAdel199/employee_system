import 'dart:async';

import 'package:employee_system/features/employees/employees.dart';
import 'package:isar/isar.dart';

class FakeEmployeeService implements EmployeeService {
  FakeEmployeeService([List<EmployeeModel>? initialEmployees])
    : _employees = List.of(initialEmployees ?? []) {
    var nextId = 1;
    for (final employee in _employees) {
      employee.id = nextId++;
    }
  }

  final List<EmployeeModel> _employees;
  final _controller = StreamController<List<EmployeeModel>>.broadcast();

  void _notify() => _controller.add(List.unmodifiable(_employees));

  @override
  Future<List<EmployeeModel>> getEmployees({
    EmployeeFilter filter = const EmployeeFilter(),
    int? limit,
  }) async {
    return _applyFilter(filter, limit: limit);
  }

  @override
  Stream<List<EmployeeModel>> watchEmployees({
    EmployeeFilter filter = const EmployeeFilter(),
    int? limit,
  }) async* {
    yield _applyFilter(filter, limit: limit);
    yield* _controller.stream.map((_) => _applyFilter(filter, limit: limit));
  }

  List<EmployeeModel> _applyFilter(EmployeeFilter filter, {int? limit}) {
    final text = filter.normalizedSearchText.toLowerCase();

    var results = _employees.where((employee) {
      if (filter.hasSearchText) {
        final matches =
            employee.fullName.toLowerCase().contains(text) ||
            employee.nationalNumber.toLowerCase().contains(text) ||
            employee.employeeNumber.toLowerCase().contains(text) ||
            employee.phoneNumber.toLowerCase().contains(text) ||
            employee.jobTitle.toLowerCase().contains(text) ||
            employee.currentWorkplace.toLowerCase().contains(text);
        if (!matches) {
          return false;
        }
      }
      if (filter.gender != null && employee.gender != filter.gender) {
        return false;
      }
      if (filter.maritalStatus != null &&
          employee.maritalStatus != filter.maritalStatus) {
        return false;
      }
      if (filter.educationLevel != null &&
          employee.educationLevel != filter.educationLevel) {
        return false;
      }
      if (filter.hasJobTitle &&
          employee.jobTitle != filter.normalizedJobTitle) {
        return false;
      }
      if (filter.hasCurrentWorkplace &&
          employee.currentWorkplace != filter.normalizedCurrentWorkplace) {
        return false;
      }
      return true;
    }).toList()..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (limit != null) {
      results = results.take(limit).toList();
    }
    return results;
  }

  @override
  Future<EmployeeModel?> getEmployeeById(Id id) async {
    for (final employee in _employees) {
      if (employee.id == id) {
        return employee;
      }
    }
    return null;
  }

  @override
  Future<EmployeeModel> saveEmployee(EmployeeModel employee) async {
    final now = DateTime.now();

    if (employee.id == Isar.autoIncrement) {
      final maxId = _employees.fold<int>(
        0,
        (max, e) => e.id > max ? e.id : max,
      );
      employee.id = maxId + 1;
      employee.createdAt = now;
      employee.updatedAt = now;
      _employees.add(employee);
    } else {
      final index = _employees.indexWhere((e) => e.id == employee.id);
      employee.updatedAt = now;
      if (index >= 0) {
        _employees[index] = employee;
      } else {
        _employees.add(employee);
      }
    }

    _notify();
    return employee;
  }

  @override
  Future<bool> deleteEmployee(Id id) async {
    final before = _employees.length;
    _employees.removeWhere((employee) => employee.id == id);
    final removed = _employees.length != before;
    if (removed) {
      _notify();
    }
    return removed;
  }

  @override
  Future<List<EmployeeModel>> getRecentEmployees({int limit = 5}) {
    return getEmployees(limit: limit);
  }

  @override
  Future<EmployeeStatistics> getStatistics() async {
    return EmployeeStatistics(
      totalCount: _employees.length,
      maleCount: _employees.where((e) => e.gender == Gender.male).length,
      femaleCount: _employees.where((e) => e.gender == Gender.female).length,
    );
  }

  @override
  Future<List<String>> getJobTitles() async {
    return _distinct(_employees.map((e) => e.jobTitle));
  }

  @override
  Future<List<String>> getCurrentWorkplaces() async {
    return _distinct(_employees.map((e) => e.currentWorkplace));
  }

  List<String> _distinct(Iterable<String> values) {
    final result =
        values.map((v) => v.trim()).where((v) => v.isNotEmpty).toSet().toList()
          ..sort();
    return result;
  }

  @override
  Future<bool> existsByNationalNumber(
    String nationalNumber, {
    Id? excludeId,
  }) async {
    final normalized = nationalNumber.trim();
    if (normalized.isEmpty) {
      return false;
    }
    return _employees.any(
      (e) => e.nationalNumber == normalized && e.id != excludeId,
    );
  }

  @override
  Future<bool> existsByEmployeeNumber(
    String employeeNumber, {
    Id? excludeId,
  }) async {
    final normalized = employeeNumber.trim();
    if (normalized.isEmpty) {
      return false;
    }
    return _employees.any(
      (e) => e.employeeNumber == normalized && e.id != excludeId,
    );
  }

  @override
  Future<EmployeeModel?> getEmployeeByNationalNumber(
    String nationalNumber,
  ) async {
    final normalized = nationalNumber.trim();
    if (normalized.isEmpty) {
      return null;
    }
    for (final employee in _employees) {
      if (employee.nationalNumber == normalized) {
        return employee;
      }
    }
    return null;
  }

  @override
  Future<EmployeeModel?> getEmployeeByEmployeeNumber(
    String employeeNumber,
  ) async {
    final normalized = employeeNumber.trim();
    if (normalized.isEmpty) {
      return null;
    }
    for (final employee in _employees) {
      if (employee.employeeNumber == normalized) {
        return employee;
      }
    }
    return null;
  }
}
