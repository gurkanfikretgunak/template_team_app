import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/auth/sign_in/sign_in.viewmodel.dart';
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInWidgets {
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.onlyLRTBpaddingNormal,
        child: Wrap(
          runSpacing: 20,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleTexts(context),
            textFormFieldsAndButton(context),
            forgotPasswordText(context),
            divider(context),
            loginWithOrganization(context),
          ],
        ),
      ),
    );
  }

  Center loginWithOrganization(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomSocialIcon(
            imagePath: SocialPath.google,
            height: IconSize.large,
            width: IconSize.large,
            socialName: L10n.of(context)!.continueWithGoogle,
          ),
          CustomSocialIcon(
            imagePath: SocialPath.apple,
            height: IconSize.large,
            width: IconSize.large,
            socialName: L10n.of(context)!.continueWithApple,
          ),
        ],
      ),
    );
  }

  Row divider(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: CustomDivider()),
        Padding(
          padding: context.horizontalPaddingMedium,
          child: Text(L10n.of(context)!.or),
        ),
        const Expanded(child: CustomDivider()),
      ],
    );
  }

  Center forgotPasswordText(BuildContext context) {
    return Center(
      child: CustomTextButton(
        onPressed: () {
          NavigationService.instance.navigateToPage(Routes.forgotPassword.name);
        },
        text: L10n.of(context)!.forgotPassword,
        buttonSize: ButtonSize.large,
      ),
    );
  }

  Widget textFormFieldsAndButton(BuildContext context) {
    final provider = Provider.of<SignInViewModel>(context);
    return Wrap(
      children: [
        CustomTextFormField(
          labelTextValue: L10n.of(context)!.email,
          hintText: "johndoe@gmail.com",
        ),
        CustomTextFormField(
          labelTextValue: L10n.of(context)!.password,
          hintText: L10n.of(context)!.setPassword,
        ),
        SizedBox(
          width: context.dynamicWidth(1),
          child: CustomElevatedButton(
            onPressed: () async {
              if (await provider.permissionGetCache()) {
                NavigationService.instance
                    .navigateToPageClear(path: Routes.navigation.name);
              } else {
                NavigationService.instance
                    .navigateToPageClear(path: Routes.permission.name);
                await provider.permissionSetCache(true);
              }
            },
            text: L10n.of(context)!.login,
            buttonSize: ButtonSize.large,
            buttonColor: ButtonColor.purple,
            textColor: ButtonColor.light,
          ),
        ),
      ],
    );
  }

  Column titleTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          L10n.of(context)!.welcomeBack,
          style: TextConstants.instance.heading4,
        ),
        Row(
          children: [
            Text(
              L10n.of(context)!.haventAnAccount,
              style: TextConstants.instance.subtitle1,
            ),
            CustomTextButton(
              onPressed: () {
                NavigationService.instance.navigateToPage(Routes.signup.name);
              },
              padding: EdgeInsets.zero,
              buttonSize: ButtonSize.small,
              hasUnderline: true,
              text: L10n.of(context)!.signup,
            )
          ],
        ),
      ],
    );
  }
}
