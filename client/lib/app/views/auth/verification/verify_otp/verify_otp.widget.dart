import 'package:client/app/views/auth/verification/verify_otp/widget/otp_input.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/buttons/widgets/custom_text_button.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class VerifyOtpWidgets {
  Widget otpInputBody(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Wrap(
              runSpacing: 30,
              children: [
                Text("Verify OTP", style: TextConstants.instance.heading6),
                const OtpInput(),
                Row(
                  children: [
                    Text("Didn't Receive the Code?",
                        style: TextConstants.instance.label1
                            .copyWith(color: ColorConstant.instance.dark3)),
                    CustomTextButton(onPressed: () {}, text: "Resend")
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.dynamicWidth(1),
            child: CustomElevatedButton(
              onPressed: () {},
              text: "Verify OTP",
              buttonSize: ButtonSize.large,
              textColor: ButtonColor.light,
            ),
          ),
        ],
      ),
    );
  }
}
