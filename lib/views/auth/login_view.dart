import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infohive/widgets/login/forgot_password_label.dart';

import '../../services/auth/auth_exception.dart';
import '../../services/auth/bloc/auth_bloc.dart';
import '../../services/auth/bloc/auth_event.dart';
import '../../services/auth/bloc/auth_state.dart';

import '../../widgets/login/login_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOutState) {
          if (state.exception is EmptyMailException) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email cannot be empty"),
              ),
            );
          }

          if (state.exception is EmptyPasswordException) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Password cannot be empty"),
              ),
            );
          }

          if (state.exception is UserNotFoundException) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text("There is no user with that email. Try to create one"),
              ),
            );
          }
          if (state.exception is WrongPasswordException) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Wrong password. Try again"),
              ),
            );
          }

          if (state.exception is GenericException) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Authentication error"),
              ),
            );
          }
        }
      },
      child: Scaffold(
          body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    title(),
                    const SizedBox(height: 50),
                    emailPasswordWidget(
                      email: _emailController,
                      password: _passwordController,
                    ),
                    const SizedBox(height: 20),
                    submitButton(
                      context,
                      onTap: () {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        context.read<AuthBloc>().add(AuthLogInEvent(
                              email,
                              password,
                            ));
                      },
                    ),
                    forgotPasswordLabel(
                      onTap: () {
                        context.read<AuthBloc>().add(const AuthForgotPasswordEvent());
                      },
                    ),
                    SizedBox(height: height * .055),
                    createAccountLabel(onTap: () {
                      context
                          .read<AuthBloc>()
                          .add(const AuthShouldRegisterEvent());
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
