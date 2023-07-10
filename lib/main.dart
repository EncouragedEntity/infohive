import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infohive/services/auth/bloc/auth_bloc.dart';
import 'package:infohive/services/auth/bloc/auth_event.dart';
import 'package:infohive/services/auth/bloc/auth_state.dart';

import 'helpers/loading/loading_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      home: BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(),
    child: const HomePage(),
  )));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthInitializeEvent());
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
        if (state is AuthLoggedInState) {}
        if (state is AuthNeedsVerificationState) {}
        if (state is AuthLoggedOutState) {}
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
