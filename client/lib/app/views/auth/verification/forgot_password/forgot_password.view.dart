import 'package:client/app/views/auth/verification/forgot_password/forgot_password.widget.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends BaseView with ForgotPasswordWidgets {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      appbar: CustomAppbar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
          ),
        ),
      ),
      body: enterMobileNumberBody(context),
    );
  }
}
