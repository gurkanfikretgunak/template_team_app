import 'package:client/app/views/auth/sign_in/sign_in.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

class SignInView extends BaseView with SignInWidgets {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc())
      ],
      child: baseBuild(
        context,
        body: body(context),
      ),
    );
  }
}
