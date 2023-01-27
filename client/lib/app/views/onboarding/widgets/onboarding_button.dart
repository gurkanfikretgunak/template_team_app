import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingViewModel>(context);

    return provider.currentIndex == 3
        ? SizedBox(
            width: context.dynamicWidth(1),
            child: CustomElevatedButton(
              onPressed: () {
                NavigationService.instance.navigateToPage(Routes.signin.name);
              },
              text: L10n.of(context)!.login,
              buttonColor: ButtonColor.light,
              buttonSize: ButtonSize.large,
            ),
          )
        : provider.currentIndex == 1 || provider.currentIndex == 2
            ? SizedBox(
                width: context.dynamicWidth(1),
                child: CustomOutlinedButton(
                  onPressed: () {
                    provider.pageController!.nextPage(
                      duration: context.durationLow,
                      curve: Curves.easeInOut,
                    );
                    provider.currentIndex = provider.currentIndex + 1;
                  },
                  text: L10n.of(context)!.next,
                  borderSideColor: ButtonColor.light,
                  buttonSize: ButtonSize.large,
                ),
              )
            : SizedBox(
                width: context.dynamicWidth(1),
                child: CustomOutlinedButton(
                  onPressed: () {
                    provider.pageController!.nextPage(
                      duration: context.durationLow,
                      curve: Curves.easeInOut,
                    );
                    provider.currentIndex = provider.currentIndex + 1;
                  },
                  text: L10n.of(context)!.getStarted,
                  borderSideColor: ButtonColor.light,
                  buttonSize: ButtonSize.large,
                ),
              );
  }
}
