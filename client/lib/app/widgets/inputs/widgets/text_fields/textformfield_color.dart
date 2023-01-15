import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

enum TextFormFieldColor {
  transparent,
  dark,
  green,
  red,
  purple,
}

class TextFormFieldColorLabel {
  TextFormFieldColorLabel();

  color(borderSideColor) {
    switch (borderSideColor) {
      case TextFormFieldColor.transparent:
        return ColorConstant.instance.transparent;
      case TextFormFieldColor.dark:
        return ColorConstant.instance.dark4;
      case TextFormFieldColor.green:
        return ColorConstant.instance.green0;
      case TextFormFieldColor.red:
        return ColorConstant.instance.red0;
      case TextFormFieldColor.purple:
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
