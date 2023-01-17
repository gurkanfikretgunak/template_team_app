import 'package:client/app/views/auth/verify_mobile/widget/otp_input.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/buttons/widgets/custom_text_button.dart';
import 'package:client/app/widgets/system_ui_overlay/navigation/custom_navigation.dart';
import 'package:client/app/widgets/system_ui_overlay/navigation/navigation_select.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class OtpInputWidgets {
  Widget otpInputBody(BuildContext context) {
    return Padding(
      padding: context.onlyLRTBpaddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationsWidget(false, () {}, Navigations.back, "Verify OTP"),
                Padding(
                  padding: context.onlyTopPaddingHigh,
                  child: const OtpInput(),
                ),
                Row(
                  children: [
                    Text(
                      "Didn't Receive the Code?",
                    ),
                    CustomTextButton(onPressed: () {}, text: "Resend")
                  ],
                ),
              ],
            ),
          ),
          CustomElevatedButton(
              onPressed: () {}, text: "Verify OTP", buttonSize: ButtonSize.large, buttonColor: ButtonColor.purple),
        ],
      ),
    );
  }
}
