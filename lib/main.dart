import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infohive/services/auth/bloc/auth_bloc.dart';
import 'package:infohive/services/auth/bloc/auth_event.dart';
import 'package:infohive/services/auth/bloc/auth_state.dart';
import 'package:infohive/services/auth/firebase_auth_provider.dart';
import 'package:infohive/views/articles/articles_view.dart';
import 'package:infohive/views/auth/login_view.dart';

import 'helpers/loading/loading_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthInitializeEvent());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
              context: context, text: state.loadingText ?? 'Wait a sec...');
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthRegisteringState) {}
        if (state is AuthLoggedInState) {
          return const ArticlesView();
        }
        if (state is AuthNeedsVerificationState) {}
        if (state is AuthLoggedOutState) {
          return const LoginView();
        }
        if (state is AuthForgotPasswordState) {}
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
