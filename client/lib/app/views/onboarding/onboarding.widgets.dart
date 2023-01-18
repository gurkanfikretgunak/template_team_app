import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/views/onboarding/widgets/indicator.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/routes/custom_navigator.dart';
import 'package:client/core/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/buttons_widgets.dart';

class OnboardingWidgets {
  Widget foregroundItem(OnboardingViewModel provider, BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Transform(
        transform: Matrix4.translationValues(0, context.dynamicHeight(0.56), 0),
        child: Column(
          // runSpacing: 30,
          children: [
            SizedBox(
              height: context.dynamicHeight(0.2),
              child: Text(
                selectText(provider.currentIndex),
                style: TextConstants.instance.subtitle2.copyWith(
                    color: ColorConstant.instance.light4, fontSize: 35),
              ),
            ),
            context.emptySizedHeightBoxNormal,
            SizedBox(
              width: context.dynamicWidth(1),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: <Widget>[
                  Indicator(
                    positionIndex: 0,
                    currentIndex: provider.currentIndex,
                  ),
                  Indicator(
                    positionIndex: 1,
                    currentIndex: provider.currentIndex,
                  ),
                  Indicator(
                    positionIndex: 2,
                    currentIndex: provider.currentIndex,
                  ),
                  Indicator(
                    positionIndex: 3,
                    currentIndex: provider.currentIndex,
                  ),
                ],
              ),
            ),
            context.emptySizedHeightBoxNormal,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlinedButton(
                  onPressed: () {
                    CustomNavigator.goToScreen(context, Routes.signin.name);
                  },
                  text: "Login",
                  borderSideColor: ButtonColor.light,
                  buttonSize: ButtonSize.large,
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  text: "Get Started",
                  buttonColor: ButtonColor.light,
                  buttonSize: ButtonSize.large,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  selectText(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return "Schedule your Appointment with the best Hair Stylist in your Town.";
      case 1:
        return "Schedule the Appointmentin the best Salon for your Kids";
      case 2:
        return "Book yourself a massage therapist to release all your stress ";
      case 3:
        return "Search for the best parlournear you to fulfil all your beauty needs";

      default:
    }
  }
}
