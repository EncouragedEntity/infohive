import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infohive/services/auth/bloc/auth_bloc.dart';
import 'package:infohive/services/auth/bloc/auth_event.dart';
import 'package:infohive/services/auth/bloc/auth_state.dart';
import 'package:infohive/widgets/register/login_account_label.dart';

import '../../widgets/login/bezier_container.dart';
import '../../widgets/register/email_password.dart';
import '../../widgets/register/submit_button.dart';
import '../../widgets/register/title.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        //TODO exceptions
      },
      child: Scaffold(
        body: SizedBox(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
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
                      const SizedBox(
                        height: 50,
                      ),
                      emailPasswordWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      submitButton(context, onTap: () { 
                        //TODO onTap
                       }),
                      loginAccountLabel(onTap: (){
                      context
                          .read<AuthBloc>()
                          .add(const AuthLogOutEvent());
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
