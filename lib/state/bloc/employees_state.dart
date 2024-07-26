
import 'package:equatable/equatable.dart';

import '../../models/Employee.dart';

enum EmployeesStatus { initial, success, failure }

final class EmployeesState extends Equatable {


  const EmployeesState({
    this.status = EmployeesStatus.initial,
    this.employees = const <Employee>[],
    this.employeeInfo,
  });

  final EmployeesStatus status;
  final List<Employee> employees;
  final Employee? employeeInfo;

  EmployeesState copyWith({
    EmployeesStatus? status,
    List<Employee>? employees,
    Employee? employeeInfo,
  }) {
    return EmployeesState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      employeeInfo: employeeInfo ?? this.employeeInfo,
    );
  }


  @override
  List<Object> get props => [status, employees,];
}
