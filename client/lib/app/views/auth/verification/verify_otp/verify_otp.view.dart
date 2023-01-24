import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/auth/verification/verify_otp/verify_otp.widget.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class VerifyOtbView extends BaseView with VerifyOtpWidgets {
  const VerifyOtbView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      appbar: CustomAppbar(title: L10n.of(context)!.verifyOtp),
      body: otpInputBody(context),
    );
  }
}
