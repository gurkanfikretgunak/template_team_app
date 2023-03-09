import 'package:client/core/services/retrofit/retrofit_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client/app/views/auth/sign_in/bloc/login_events.dart';
import 'package:client/app/views/auth/sign_in/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController passwordText = TextEditingController();
  final TextEditingController emailText = TextEditingController();
  LoginBloc() : super(LoginInitialState()) {
    on<LoginButtonEvent>((event, emit) async {
      emit(LoginLoadingState());
      var postsResponse = await RetrofitService.instance
          .login(emailText.text, passwordText.text);
      if (postsResponse.success == true) {
        emit(LoginLoadedState(postsResponse));
      } else {
        emit(LoginErrorState(postsResponse.message ?? "Error"));
      }
    });
  }
}
