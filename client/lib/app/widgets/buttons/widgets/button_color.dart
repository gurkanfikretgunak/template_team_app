import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

enum ButtonColor {
  transparent,
  dark,
  green,
  red,
  purple,
}

class ButtonColorLabel {
  ButtonColorLabel();

  color(buttonColor) {
    switch (buttonColor) {
      case ButtonColor.transparent:
        return ColorConstant.instance.transparent;
      case ButtonColor.dark:
        return ColorConstant.instance.dark4;
      case ButtonColor.green:
        return ColorConstant.instance.green0;
      case ButtonColor.red:
        return ColorConstant.instance.red0;
      case ButtonColor.purple:
        return ColorConstant.instance.purple2;
      default:
        return ColorConstant.instance.dark0;
    }
  }

  static Color transparent() => ColorConstant.instance.transparent;
  static Color dark() => ColorConstant.instance.dark0;
  static Color green() => ColorConstant.instance.green0;
  static Color red() => ColorConstant.instance.red0;
  static Color purple() => ColorConstant.instance.purple2;
}
