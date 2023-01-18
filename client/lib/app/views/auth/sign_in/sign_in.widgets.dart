import 'package:client/app/views/auth/widgets/custom_social_icon.dart';
import 'package:client/app/views/auth/widgets/social_image_path.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/buttons/widgets/custom_text_button.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/init/routes/custom_navigator.dart';
import 'package:client/core/init/routes/routes.dart';

import 'package:flutter/material.dart';

class SignInWidgets {
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.onlyLRTBpaddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.onlyBottomPaddingHigh,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextConstants.instance.heading4,
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextConstants.instance.subtitle1,
                      ),
                      CustomTextButton(
                        onPressed: () {
                          CustomNavigator.goToScreen(
                              context, Routes.signup.name);
                        },
                        padding: EdgeInsets.zero,
                        buttonSize: ButtonSize.small,
                        hasUnderline: true,
                        text: "Sign Up",
                      )
                    ],
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                const CustomTextFormField(
                    labelTextValue: "Email", hintText: "john@example.com"),
                const CustomTextFormField(
                    labelTextValue: "Password", hintText: "Set a password"),
                SizedBox(
                  width: context.dynamicWidth(1),
                  child: CustomElevatedButton(
                    onPressed: () {
                      CustomNavigator.goToScreen(
                          context, Routes.navigation.name);
                    },
                    text: "Login",
                    buttonSize: ButtonSize.large,
                    buttonColor: ButtonColor.purple,
                    textColor: ButtonColor.light,
                  ),
                ),
              ],
            ),
            Padding(
              padding: context.verticalPaddingNormal,
              child: Center(
                child: CustomTextButton(
                  onPressed: () {
                    CustomNavigator.goToScreen(context, Routes.verification);
                  },
                  text: "Forgot your password",
                  buttonSize: ButtonSize.large,
                ),
              ),
            ),
            Padding(
              padding: context.verticalPaddingMedium +
                  context.onlyBottomPaddingMedium,
              child: Row(
                children: [
                  const Expanded(child: CustomDivider()),
                  Padding(
                    padding: context.horizontalPaddingMedium,
                    child: const Text("Or Login using"),
                  ),
                  const Expanded(child: CustomDivider()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CustomSocialIcon(
                  imagePath: SocialPath.twitter,
                  height: IconSize.large,
                  width: IconSize.large,
                  socialName: "Twitter",
                ),
                CustomSocialIcon(
                  imagePath: SocialPath.google,
                  height: IconSize.large,
                  width: IconSize.large,
                  socialName: "Google",
                ),
                CustomSocialIcon(
                  imagePath: SocialPath.facebook,
                  height: IconSize.large,
                  width: IconSize.large,
                  socialName: "Facebook",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
