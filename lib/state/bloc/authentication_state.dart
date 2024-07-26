import 'package:equatable/equatable.dart';
import 'package:munch_login_application/models/Employee.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
 const AuthenticationState._({
  this.status = AuthenticationStatus.unknown,
  this.employee,
 });

 const AuthenticationState.unknown() : this._();

 const AuthenticationState.authenticated(Employee employee)
     : this._(status: AuthenticationStatus.authenticated, employee: employee);

 const AuthenticationState.unauthenticated()
     : this._(status: AuthenticationStatus.unauthenticated);

 final AuthenticationStatus status;
 final Employee? employee;

 @override
 List<Object?> get props => [status, employee];
}
