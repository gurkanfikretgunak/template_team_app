import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/views/onboarding/onboarding.widgets.dart';
import 'package:client/app/views/onboarding/widgets/onboarding_pages_view.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingView extends BaseView with OnboardingWidgets {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingViewModel>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          const OnboardingPagesView(),
          indicatorView(provider, context),
        ],
      ),
    );
  }
}
