import 'package:client/app/views/auth/verify_mobile/otp_input.widget.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class OtpInputView extends BaseView with OtpInputWidgets {
  const OtpInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      body: otpInputBody(context),
    );
  }
}
