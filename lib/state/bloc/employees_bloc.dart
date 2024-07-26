


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_login_application/data/employees.dart';


import '../../models/Employee.dart';
import 'employees_event.dart';
import 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeesBloc() : super(const EmployeesState()) {
    on<GetEmployees>(_onGetEmployees);
  }


  Future<List<Employee>> _fetchEmployees() async {

    await Future.delayed(const Duration(seconds: 1));
    return EmployeeData.employees;
  }


  Future<Employee?> tryGetEmployee(String nanmr) async {
    try {
      final employee = EmployeeData.employees.firstWhere(
            (employee) => employee.password == employee.name,
      );
      return employee;
    } catch (e) {
      if (e is StateError) {
        return null;
      } else {
        rethrow;
      }
    }
  }


  Future<void> _onGetEmployees(GetEmployees event, Emitter<EmployeesState> emit) async {
    try {
      if (state.status == EmployeesStatus.initial) {
        final employees = await _fetchEmployees();
        return emit(state.copyWith(
          status: EmployeesStatus.success,
          employees: employees,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: EmployeesStatus.failure));
    }
  }

}


