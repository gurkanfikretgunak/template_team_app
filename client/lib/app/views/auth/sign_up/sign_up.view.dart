import 'package:client/app/views/auth/sign_up/sign_up.widgets.dart';
import 'package:client/app/views/auth/widgets/app_bar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class SignUpView extends BaseView with SignUpWidgets {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      appbar: PreferredSize(
        preferredSize: const Size.fromHeight(160.0),
        child: Container(
          color: ColorConstant.instance.purple2,
          child: const AppBarContent(),
        ),
      ),
      body: signUpTextField(context),
    );
  }
}
