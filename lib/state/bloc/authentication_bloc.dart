import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/employees.dart';
import '../../models/Employee.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState.unknown()) {
    on<AuthenticationSubmit>(_onAuthenticationSubmit);
  }

  Future<void> _onAuthenticationSubmit(
    AuthenticationSubmit event,
    Emitter<AuthenticationState> emit,
  ) async {
    final user = await tryGetEmployee(event.password , event.name);
    emit(
      user != null
          ? AuthenticationState.authenticated(user)
          : const AuthenticationState.unauthenticated(),
    );
  }

  Future<Employee?> tryGetEmployee(String password , String name) async {
    try {
      final employee = EmployeeData.employees.firstWhere(
        (employee) => employee.password == password && employee.name == name,
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
}
