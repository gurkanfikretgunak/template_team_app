import 'package:client/app/views/permission/permission.viewmodel.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorList extends StatelessWidget {
  const IndicatorList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PermissionViewModel>(context);

    return SmoothPageIndicator(
      controller: provider.pageController!,
      count: 3,
      effect: WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: ColorConstant.instance.purple2,
        dotColor: ColorConstant.instance.purple2.withOpacity(0.2),
        strokeWidth: 2,
      ),
    );
  }
}
