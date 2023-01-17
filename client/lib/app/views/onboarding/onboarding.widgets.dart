import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/views/onboarding/widgets/indicator.dart';
import 'package:client/app/widgets/custom_text.dart';

import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/buttons_widgets.dart';

class OnboardingWidgets {
  Widget foregroundItem(OnboardingViewModel provider, BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Transform(
        transform: Matrix4.translationValues(0, context.dynamicHeight(0.6), 0),
        child: Wrap(
          runSpacing: 20,
          children: [
            CustomText(
              selectText(provider.currentIndex),
              fontSize: 30,
              color: ColorConstant.instance.light4,
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(onPressed: () {}, text: "Login"),
                CustomElevatedButton(onPressed: () {}, text: "Get Started"),
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
