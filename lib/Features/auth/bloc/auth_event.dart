part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginPageSignUpButtonClickedEvent extends AuthEvent {}

class SignUpPageLoginButtonClickedEvent extends AuthEvent {}

class AuthLogInRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLogInRequestedEvent({
    required this.email,
    required this.password,
  });
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String confirmPassword;

  AuthSignUpEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.name,
  });
}
