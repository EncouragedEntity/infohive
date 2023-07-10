import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infohive/services/auth/bloc/auth_event.dart';
import 'package:infohive/services/auth/bloc/auth_state.dart';

import '../auth_provider.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider)
      : super(const AuthUninitializedState(isLoading: true)) {
    // Verification
    on<AuthSendEmailVerificationEvent>(((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
    }));
    // Register
    on<AuthRegisterEvent>((event, emit) async {
      final email = event.email;
      final password = event.password;

      try {
        await provider.createUser(
          email: email,
          password: password,
        );
        await provider.sendEmailVerification();
        emit(const AuthNeedsVerificationState(isLoading: false));
      } on Exception catch (e) {
        emit(AuthRegisteringState(exception: e, isLoading: false));
      }
    });
    on<AuthShouldRegisterEvent>(
      (event, emit) {
        emit(const AuthRegisteringState(exception: null, isLoading: false));
      },
    );
    // Initialize
    on<AuthInitializeEvent>((event, emit) async {
      await provider.initialize();
      final user = provider.currentUser;
      if (user == null) {
        emit(const AuthLoggedOutState(
          exception: null,
          isLoading: false,
        ));
      } else if (!user.isEmailVerified) {
        emit(const AuthNeedsVerificationState(isLoading: false));
      } else {
        emit(AuthLoggedInState(user: user, isLoading: false));
      }
    });

    //Log in
    on<AuthLogInEvent>((event, emit) async {
      emit(const AuthLoggedOutState(
        exception: null,
        isLoading: true,
        loadingText: 'Logging in. Pleas wait',
      ));
      final email = event.email;
      final password = event.password;
      try {
        final user = await provider.logIn(
          email: email,
          password: password,
        );

        if (!user.isEmailVerified) {
          emit(const AuthLoggedOutState(
            exception: null,
            isLoading: false,
          ));
          emit(const AuthNeedsVerificationState(isLoading: false));
        } else {
          emit(const AuthLoggedOutState(
            exception: null,
            isLoading: false,
          ));
        }

        emit(AuthLoggedInState(user: user, isLoading: false));
      } on Exception catch (e) {
        emit(AuthLoggedOutState(exception: e, isLoading: false));
      }
    });

    //Log out
    on<AuthLogOutEvent>((event, emit) async {
      try {
        await provider.logOut();
        emit(const AuthLoggedOutState(
          exception: null,
          isLoading: false,
          loadingText: 'Logging you out. Please wait',
        ));
      } on Exception catch (e) {
        emit(AuthLoggedOutState(
          exception: e,
          isLoading: false,
          loadingText: 'Error. But I`ll log you out anyway',
        ));
      }
    });

    // Forgot password
    on<AuthForgotPasswordEvent>(((event, emit) async {
      emit(const AuthForgotPasswordState(
          exception: null, hasSentEmail: false, isLoading: false));

      final email = event.email;
      if (email == null) return;

      emit(const AuthForgotPasswordState(
          exception: null, hasSentEmail: false, isLoading: true));

      bool didSendEmail;
      Exception? exception;
      try {
        await provider.sendPasswordReset(toEmail: email);
        didSendEmail = true;
        exception = null;
      } on Exception catch (e) {
        didSendEmail = false;
        exception = e;
      }

      emit(AuthForgotPasswordState(
          exception: exception, hasSentEmail: didSendEmail, isLoading: false));
    }));
  }
}