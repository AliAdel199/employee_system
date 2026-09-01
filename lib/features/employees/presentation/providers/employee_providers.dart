import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../data/models/employee_model.dart';
import '../../data/services/employee_service.dart';

final employeeServiceProvider = Provider<EmployeeService>((ref) {
  return const IsarEmployeeService();
});

final employeeFilterProvider =
    NotifierProvider<EmployeeFilterNotifier, EmployeeFilter>(
      EmployeeFilterNotifier.new,
    );

final allEmployeesProvider = StreamProvider.autoDispose<List<EmployeeModel>>((
  ref,
) {
  final service = ref.watch(employeeServiceProvider);
  return service.watchEmployees();
});

final employeesProvider = StreamProvider.autoDispose<List<EmployeeModel>>((
  ref,
) {
  final service = ref.watch(employeeServiceProvider);
  final filter = ref.watch(employeeFilterProvider);

  return service.watchEmployees(filter: filter);
});

final recentEmployeesProvider = StreamProvider.autoDispose<List<EmployeeModel>>(
  (ref) {
    final service = ref.watch(employeeServiceProvider);
    return service.watchEmployees(limit: 5);
  },
);

final employeeByIdProvider = Provider.family<AsyncValue<EmployeeModel?>, Id>((
  ref,
  id,
) {
  final employeesAsync = ref.watch(allEmployeesProvider);

  return employeesAsync.whenData(
    (employees) => employees.where((employee) => employee.id == id).firstOrNull,
  );
});

final employeeStatisticsProvider = Provider<AsyncValue<EmployeeStatistics>>((
  ref,
) {
  final employeesAsync = ref.watch(allEmployeesProvider);

  return employeesAsync.whenData((employees) {
    final maleCount = employees.where((e) => e.gender == Gender.male).length;
    final femaleCount = employees
        .where((e) => e.gender == Gender.female)
        .length;

    return EmployeeStatistics(
      totalCount: employees.length,
      maleCount: maleCount,
      femaleCount: femaleCount,
    );
  });
});

final jobTitleOptionsProvider = Provider<AsyncValue<List<String>>>((ref) {
  final employeesAsync = ref.watch(allEmployeesProvider);

  return employeesAsync.whenData(
    (employees) =>
        _sortedDistinctValues(employees.map((employee) => employee.jobTitle)),
  );
});

final currentWorkplaceOptionsProvider = Provider<AsyncValue<List<String>>>((
  ref,
) {
  final employeesAsync = ref.watch(allEmployeesProvider);

  return employeesAsync.whenData(
    (employees) => _sortedDistinctValues(
      employees.map((employee) => employee.currentWorkplace),
    ),
  );
});

final employeeMutationControllerProvider =
    AutoDisposeAsyncNotifierProvider<EmployeeMutationController, void>(
      EmployeeMutationController.new,
    );

class EmployeeFilterNotifier extends Notifier<EmployeeFilter> {
  @override
  EmployeeFilter build() {
    return const EmployeeFilter();
  }

  void setSearchText(String value) {
    state = state.copyWith(searchText: value);
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
    state = state.copyWith(jobTitle: value ?? '');
  }

  void setCurrentWorkplace(String? value) {
    state = state.copyWith(currentWorkplace: value ?? '');
  }

  void reset() {
    state = const EmployeeFilter();
  }
}

class EmployeeMutationController extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<EmployeeModel> saveEmployee(EmployeeModel employee) async {
    final service = ref.read(employeeServiceProvider);

    state = const AsyncLoading();
    final result = await AsyncValue.guard(() => service.saveEmployee(employee));
    state = result.whenData((_) {});

    return result.requireValue;
  }

  Future<bool> deleteEmployee(Id id) async {
    final service = ref.read(employeeServiceProvider);

    state = const AsyncLoading();
    final result = await AsyncValue.guard(() => service.deleteEmployee(id));
    state = result.whenData((_) {});

    return result.valueOrNull ?? false;
  }
}

List<String> _sortedDistinctValues(Iterable<String> values) {
  final result =
      values
          .map((value) => value.trim())
          .where((value) => value.isNotEmpty)
          .toSet()
          .toList()
        ..sort();

  return result;
}
