import 'package:client/app/views/auth/verification/verification.widget.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class VerificationView extends BaseView with VerificationWidgets {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      body: otpInputBody(context),
    );
  }
}
