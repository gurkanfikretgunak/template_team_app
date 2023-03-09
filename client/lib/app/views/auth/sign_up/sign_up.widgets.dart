import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/navigation_service.dart';
import 'package:client/app/routes/routes.dart';
import 'package:client/app/views/auth/sign_up/sign_up.viewmodel.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/keyboard_type.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/provider/validation/validator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpWidgets {
  Widget signUpTextField(BuildContext context) {
    final providerSignUp = Provider.of<SignUpViewModel>(context);
    final providerValidation = Provider.of<FormViewModel>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                CustomTextFormField(
                  labelTextValue: L10n.of(context)!.fullName,
                  controller: providerSignUp.nameText,
                  hintText: "John Doe",
                  isVisible: false,
                  onChanged: providerValidation.validateName,
                  errorText: providerValidation.name.error,
                ),
                CustomTextFormField(
                    labelTextValue: L10n.of(context)!.email,
                    keyboardType: KeyboardType.email,
                    controller: providerSignUp.emailText,
                    hintText: "john@example.com",
                    isVisible: false,
                    onChanged: providerValidation.validateEmail,
                    errorText: providerValidation.email.error),
                CustomTextFormField(
                    labelTextValue: L10n.of(context)!.password,
                    controller: providerSignUp.passwordText,
                    hintText: L10n.of(context)!.setPassword,
                    isVisible: true,
                    onChanged: providerValidation.validatePassword,
                    errorText: providerValidation.password.error),
              ],
            ),
            context.emptySizedHeightBoxNormal,
            SizedBox(
              width: context.dynamicWidth(1),
              child: CustomElevatedButton(
                onPressed: () async {
                  if (providerSignUp.emailText.text.isNotEmpty &&
                      providerSignUp.passwordText.text.isNotEmpty) {
                    providerSignUp.register();

                    if (await providerSignUp.permissionGetCache()) {
                      NavigationService.instance
                          .navigateToPageClear(path: Routes.navigation.name);
                    } else {
                      NavigationService.instance
                          .navigateToPageClear(path: Routes.permission.name);
                      await providerSignUp.permissionSetCache(true);
                    }
                  } else {
                    componentSnackbar(context, "Boş bırakmayınız", "Tamam");
                  }
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

void componentSnackbar(context, String textInfo, String labelText) {
  // ignore: unused_element
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(textInfo),
    action: SnackBarAction(
      label: labelText,
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
