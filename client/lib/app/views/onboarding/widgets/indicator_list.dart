import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorList extends StatelessWidget {
  const IndicatorList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingViewModel>(context);

    return SmoothPageIndicator(
      controller: provider.pageController!,
      count: 4,
      effect: WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: ColorConstant.instance.light4,
        dotColor: ColorConstant.instance.light0.withOpacity(0.2),
        strokeWidth: 2,
      ),
    );
  }
}
// SizedBox(
//       width: context.dynamicWidth(1),
//       child: Wrap(
//         alignment: WrapAlignment.center,
//         spacing: 10,
//         children: <Widget>[
//           IndicatorItem(
//             positionIndex: 0,
//             currentIndex: provider.currentIndex,
//           ),
//           IndicatorItem(
//             positionIndex: 1,
//             currentIndex: provider.currentIndex,
//           ),
//           IndicatorItem(
//             positionIndex: 2,
//             currentIndex: provider.currentIndex,
//           ),
//           IndicatorItem(
//             positionIndex: 3,
//             currentIndex: provider.currentIndex,
//           ),
//         ],
//       ),
//     );