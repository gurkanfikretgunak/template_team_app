import 'package:client/app/views/auth/authentication/authentication.dart';
import 'package:client/core/network/retrofit/retrofit_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client/app/views/auth/sign_in/bloc/login_events.dart';
import 'package:client/app/views/auth/sign_in/bloc/login_states.dart';
import 'package:logger/logger.dart';

import '../../authentication/bloc/auth_bloc.dart';
import '../../authentication/bloc/auth_events.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController passwordText = TextEditingController();
  final TextEditingController emailText = TextEditingController();

  final AuthenticationBloc authenticationBloc;

  LoginBloc(this.authenticationBloc) : super(LoginInitialState()) {
    on<LoginButtonEvent>((event, emit) async {
      emit(LoginLoadingState());
      var postsResponse = await RetrofitService.instance
          .login(emailText.text, passwordText.text);

      Logger().e(postsResponse.success);

      if (postsResponse.success == true) {
        emit(LoginLoadedState(postsResponse));
        authenticationBloc.add(AuthLoggedInEvent(
            token: postsResponse.data![0].accessToken.toString()));
      } else {
        emit(LoginErrorState(postsResponse.message ?? "Error"));
      }
    });
  }
}
