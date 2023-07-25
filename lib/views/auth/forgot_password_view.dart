import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infohive/services/auth/bloc/auth_event.dart';
import 'package:infohive/widgets/fogot_password/back_button.dart';

import '../../services/auth/auth_exception.dart';
import '../../services/auth/bloc/auth_bloc.dart';
import '../../services/auth/bloc/auth_state.dart';
import '../../widgets/fogot_password/submit_button.dart';
import '../../widgets/login/bezier_container.dart';
import '../../widgets/login/entry_field.dart';
import '../../widgets/login/title.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthForgotPasswordState) {
          if (state.exception is EmptyMailException) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email cannot be empty"),
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
                    entryField("Email", controller: _emailController),
                    const SizedBox(height: 20),
                    submitButton(
                      context,
                      onTap: () {
                        final email = _emailController.text;
                        context
                            .read<AuthBloc>()
                            .add(AuthForgotPasswordEvent(email: email));
                      },
                    ),
                    backButton(
                      context,
                      onTap: () {
                        context.read<AuthBloc>().add(const AuthLogOutEvent());
                      },
                    ),
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
