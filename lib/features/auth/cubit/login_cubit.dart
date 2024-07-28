import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void setEmail(String? input) => emit(LoginState(email: input));

  void changePassVisibility() =>
      emit(LoginState(visiblePass: !(state.visiblePass ?? false),email: state.email));
}
