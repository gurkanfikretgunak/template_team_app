import 'package:client/app/widgets/custom_text.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class CustomShowSnackBar {
  static showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: context.durationLow,
        content: CustomText(
          text,
          color: ColorConstant.instance.light0,
        ),
      ),
    );
  }
}
