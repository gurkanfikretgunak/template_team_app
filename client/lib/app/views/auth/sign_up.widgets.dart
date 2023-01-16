import 'package:client/app/views/auth/widgets/custom_social_icon.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/icons/widgets/icon_size.dart';
import 'package:client/app/views/auth/widgets/social_image_path.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/core/extensions/common_extension.dart';

import 'package:flutter/material.dart';

class SignUpWidgets {
  Widget signUpTextField(BuildContext context) {
    return Padding(
      padding: context.onlyLRTBpaddingNormal,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          const CustomTextFormField(labelTextValue: "Name", hintText: "name"),
          const CustomTextFormField(labelTextValue: "Email", hintText: "john@example.com"),
          const CustomTextFormField(labelTextValue: "Password", hintText: "Set a password"),
          CustomElevatedButton(
              onPressed: () {}, text: "Sign Up", buttonSize: ButtonSize.large, buttonColor: ButtonColor.purple),
          Row(
            children: const [
              Expanded(child: CustomDivider()),
              Text("Or Sign up using"),
              Expanded(child: CustomDivider()),
            ],
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
          )
        ],
      ),
    );
  }
}
