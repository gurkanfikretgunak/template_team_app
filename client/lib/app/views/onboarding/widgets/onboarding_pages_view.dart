import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPagesView extends StatefulWidget {
  const OnboardingPagesView({super.key});

  @override
  State<OnboardingPagesView> createState() => _OnboardingPagesViewState();
}

class _OnboardingPagesViewState extends State<OnboardingPagesView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingViewModel>(context);

    return PageView(
      controller: provider.pageController,
      onPageChanged: onChangedFunction,
      children: <Widget>[
        imageContainer(Assets.images.onboarding.background1.path),
        imageContainer(Assets.images.onboarding.background2.path),
        imageContainer(Assets.images.onboarding.background3.path),
        imageContainer(Assets.images.onboarding.background4.path),
      ],
    );
  }

  Widget imageContainer(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcOver),
        ),
      ),
    );
  }

  onChangedFunction(int index) {
    Provider.of<OnboardingViewModel>(context, listen: false).currentIndex = index;
  }
}
