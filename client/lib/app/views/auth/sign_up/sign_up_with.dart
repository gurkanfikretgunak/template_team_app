import 'package:client/app/views/auth/widgets/custom_social_icon.dart';
import 'package:client/app/views/auth/widgets/social_image_path.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/constans/color_constants.dart';
import '../../../l10n/app_l10n.dart';
import '../../../routes/navigation_service.dart';
import '../../../routes/routes.dart';
import '../../../widgets/buttons/widgets/button_color.dart';
import '../../../widgets/buttons/widgets/button_size.dart';
import '../../../widgets/buttons/widgets/custom_elevated_button.dart';
import '../../../widgets/divider/widgets/custom_divider.dart';
import '../../../widgets/image_viewer/icons/icons_widgets.dart';
import '../widgets/app_bar.dart';

class CustomSignUpWith extends BaseView {
  const CustomSignUpWith({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      appbar: PreferredSize(
        preferredSize: const Size.fromHeight(160.0),
        child: Container(
          color: ColorConstant.instance.purple2,
          child: const AppBarContent(),
        ),
      ),
      body: Padding(
        padding: context.onlyLRTBpaddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const CustomSocialIcon(
                  imagePath: SocialPath.twitter,
                  height: IconSize.large,
                  width: IconSize.large,
                  socialName: "Continue with Twitter",
                ),
                context.emptySizedHeightBoxNormal,
                const CustomSocialIcon(
                  imagePath: SocialPath.google,
                  height: IconSize.large,
                  width: IconSize.large,
                  socialName: "Continue with Google",
                ),
                context.emptySizedHeightBoxNormal,
                const CustomSocialIcon(
                  imagePath: SocialPath.facebook,
                  height: IconSize.large,
                  width: IconSize.large,
                  socialName: "Continue with Facebook",
                ),
              ],
            ),
            Padding(
              padding: context.verticalPaddingMedium,
              child: Row(
                children: [
                  const Expanded(child: CustomDivider()),
                  Padding(
                    padding: context.horizontalPaddingMedium,
                    child: Text(L10n.of(context)!.orSignupUsing),
                  ),
                  const Expanded(child: CustomDivider()),
                ],
              ),
            ),
            SizedBox(
              width: context.dynamicWidth(1),
              child: CustomElevatedButton(
                onPressed: () {
                  NavigationService.instance.navigateToPage(Routes.signup.name);
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
