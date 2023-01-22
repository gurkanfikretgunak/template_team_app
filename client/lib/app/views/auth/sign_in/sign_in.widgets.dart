import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
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

class SignInWidgets {
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.onlyLRTBpaddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.onlyBottomPaddingNormal,
              child: Column(
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
                          NavigationService.instance
                              .navigateToPage(Routes.withSignUp.name);
                        },
                        padding: EdgeInsets.zero,
                        buttonSize: ButtonSize.small,
                        hasUnderline: true,
                        text: L10n.of(context)!.signup,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                CustomTextFormField(
                  labelTextValue: L10n.of(context)!.email,
                ),
                CustomTextFormField(
                  labelTextValue: L10n.of(context)!.password,
                ),
                SizedBox(
                  width: context.dynamicWidth(1),
                  child: CustomElevatedButton(
                    onPressed: () {
                      NavigationService.instance
                          .navigateToPageClear(path: Routes.navigation.name);
                    },
                    text: L10n.of(context)!.login,
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
                    NavigationService.instance
                        .navigateToPage(Routes.forgotPassword.name);
                  },
                  text: L10n.of(context)!.forgotPassword,
                  buttonSize: ButtonSize.large,
                ),
              ),
            ),
            Padding(
              padding: context.verticalPaddingNormal,
              child: Row(
                children: [
                  const Expanded(child: CustomDivider()),
                  Padding(
                    padding: context.horizontalPaddingMedium,
                    child: Text(L10n.of(context)!.or),
                  ),
                  const Expanded(child: CustomDivider()),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomSocialIcon(
                    imagePath: SocialPath.twitter,
                    height: IconSize.large,
                    width: IconSize.large,
                    socialName: L10n.of(context)!.continueWithTwitter,
                  ),
                  CustomSocialIcon(
                    imagePath: SocialPath.google,
                    height: IconSize.large,
                    width: IconSize.large,
                    socialName: L10n.of(context)!.continueWithGoogle,
                  ),
                  CustomSocialIcon(
                    imagePath: SocialPath.facebook,
                    height: IconSize.large,
                    width: IconSize.large,
                    socialName: L10n.of(context)!.continueWithFacebook,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
