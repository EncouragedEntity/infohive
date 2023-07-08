import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infohive/services/auth/bloc/auth_event.dart';
import 'package:infohive/services/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

}