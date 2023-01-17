import 'package:client/app/views/auth/sign_in/sign_in.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class SignInView extends BaseView with SignInWidgets {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      body: signInTextField(context),
    );
  }
}
