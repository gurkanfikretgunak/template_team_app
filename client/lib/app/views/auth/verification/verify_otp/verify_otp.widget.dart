import 'package:client/app/l10n/app_l10n.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            runSpacing: 30,
            children: [
              Text(L10n.of(context)!.verifyOtp,
                  style: TextConstants.instance.heading6),
              const OtpInput(),
              Row(
                children: [
                  Text(L10n.of(context)!.didntReceiveCode,
                      style: TextConstants.instance.label1
                          .copyWith(color: ColorConstant.instance.dark3)),
                  CustomTextButton(
                      onPressed: () {}, text: L10n.of(context)!.resend)
                ],
              ),
            ],
          ),
          Padding(
            padding: context.verticalPaddingMedium,
            child: SizedBox(
              width: context.dynamicWidth(1),
              child: CustomElevatedButton(
                onPressed: () {},
                text: L10n.of(context)!.verifyOtp,
                buttonSize: ButtonSize.large,
                textColor: ButtonColor.light,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
