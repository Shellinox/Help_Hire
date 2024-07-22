import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogInRequestedEvent>(authLogInRequestedEvent);
    on<AuthSignUpEvent>(authSignUpEvent);
    on<LoginPageSignUpButtonClickedEvent>((event, emit) => emit(AuthAction()));
    on<SignUpPageLoginButtonClickedEvent>((event, emit) => emit(AuthAction()));
  }

  authLogInRequestedEvent(
      AuthLogInRequestedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final firebaseAuth = FirebaseAuth.instance;
      final email = event.email;
      final password = event.password;
      const source = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
      final regex = RegExp(source);
      if (password.length < 6) {
        return emit(AuthFailure("Password can not be less than 6 charecters"));
      }

      if (!regex.hasMatch(email)) {
        return emit(AuthFailure("email format is incorrect"));
      }
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => emit(AuthSuccess()));
    } on FirebaseAuthException catch (e) {
      return emit(
        AuthFailure(
          e.code,
        ),
      );
    }
  }

  authSignUpEvent(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final firebaseAuth = FirebaseAuth.instance;
      final email = event.email;
      final password = event.password;
      final confirmpassword = event.confirmPassword;
      final name = event.name;
      const source = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
      final regex = RegExp(source);
      if (password.length < 6) {
        return emit(AuthFailure("Password can not be less than 6 charecters"));
      }
      if (password != confirmpassword) {
        emit(AuthFailure("Passwords do not match"));
        return;
      }

      if (!regex.hasMatch(email)) {
        return emit(AuthFailure("email format is incorrect"));
      }
      if (name.isEmpty) {
        return emit(AuthFailure("Enter your name"));
      }
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => emit(AuthSuccess()));
    } catch (e) {
      return emit(
        AuthFailure(
          e.toString(),
        ),
      );
    }
  }
}
