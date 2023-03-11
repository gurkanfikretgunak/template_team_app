// ignore_for_file: must_be_immutable

import 'package:client/core/model/login/user_login_request.dart';
import 'package:client/core/model/login/user_login_response.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  LoginLoadedState(this.userRequest);
  UserLoginResponse userRequest;
  bool navigateT = false;
}

class LoginErrorState extends LoginState {
  const LoginErrorState(this.e);
  final String e;
}
