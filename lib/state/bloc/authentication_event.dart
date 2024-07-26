

import 'package:munch_login_application/state/bloc/authentication_state.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}


final class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;
}

final class AuthenticationSubmit extends AuthenticationEvent {
  const AuthenticationSubmit(this.password , this.name);

  final String password;
  final String name;
}



