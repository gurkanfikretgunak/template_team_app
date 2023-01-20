import 'package:client/app/views/onboarding/onboarding.view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/cupertino.dart';

class SplashWidgets {
  body(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(context.durationSlow),
      builder: (ctx, timer) => timer.connectionState == ConnectionState.done
          ? const OnboardingView()
          : Container(
              height: context.dynamicHeight(1),
              width: context.dynamicWidth(1),
              color: ColorConstant.instance.purple2,
              child: Center(
                child: Text(
                  "Logo",
                  style: TextConstants.instance.heading4
                      .copyWith(color: ColorConstant.instance.light0),
                ),
              )),
    );
  }
}
