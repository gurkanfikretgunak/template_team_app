import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/auth/widgets/custom_social_icon.dart';
import 'package:client/app/views/auth/widgets/social_image_path.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/keyboard_type.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class SignUpWidgets {
  Widget signUpTextField(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.onlyLRTBpaddingNormal,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            CustomTextFormField(
              labelTextValue: L10n.of(context)!.fullName,
              hintText: L10n.of(context)!.fullName,
            ),
            CustomTextFormField(
              labelTextValue: L10n.of(context)!.email,
              hintText: "john@example.com",
              keyboardType: KeyboardType.email,
            ),
            CustomTextFormField(
              labelTextValue: L10n.of(context)!.password,
              hintText: "Set a password",
            ),
            SizedBox(
              width: context.dynamicWidth(1),
              child: CustomElevatedButton(
                onPressed: () {
                  NavigationService.instance.navigateToPage(Routes.signin.name);
                },
                text: L10n.of(context)!.signup,
                buttonSize: ButtonSize.large,
                buttonColor: ButtonColor.purple,
                textColor: ButtonColor.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
