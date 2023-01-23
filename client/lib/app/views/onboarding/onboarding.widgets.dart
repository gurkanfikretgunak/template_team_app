import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/views/onboarding/widgets/indicator_list.dart';
import 'package:client/app/views/onboarding/widgets/onboarding_button.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class OnboardingWidgets {
  Widget foregroundItem(OnboardingViewModel provider, BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            selectText(provider.currentIndex, context),
            style: TextConstants.instance.subtitle2
                .copyWith(color: ColorConstant.instance.light4, fontSize: 35),
          ),
          context.emptySizedHeightBoxNormal,
          const IndicatorList(),
          context.emptySizedHeightBoxNormal,
          const OnboardingButton(),
          context.emptySizedHeightBoxHigh,
        ],
      ),
    );
  }

  selectText(int pageIndex, BuildContext context) {
    switch (pageIndex) {
      case 0:
        return L10n.of(context)!.onboardingTextOne;
      case 1:
        return L10n.of(context)!.onboardingTextTwo;
      case 2:
        return L10n.of(context)!.onboardingTextThree;
      case 3:
        return L10n.of(context)!.onboardingTextFour;
    }
  }
}
