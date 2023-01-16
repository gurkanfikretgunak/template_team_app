import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/divider/custom_divider.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/core/extensions/common_extension.dart';

import 'package:flutter/material.dart';

class SignUpWidgets {
  Widget signUpTextField(OnboardingViewModel provider, BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Column(
        children: [
          const CustomTextFormField(labelTextValue: "Name", hintText: "name"),
          const CustomTextFormField(
            labelTextValue: "Email",
            hintText: "john@example.com",
          ),
          const CustomTextFormField(
            labelTextValue: "Password",
            hintText: "Set a password",
          ),
          CustomElevatedButton(
            onPressed: () {},
            text: "Sign Up",
            buttonSize: ButtonSize.large,
            buttonColor: ButtonColor.purple,
          ),
          Row(
            children: [
              CustomDivider(),
            ],
          )
        ],
      ),
    );
  }
}
