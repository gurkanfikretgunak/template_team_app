import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

enum StatusBarColor {
  dark,
  light,
}

class StatusBarColorLabel {
  StatusBarColorLabel();

  static Color dark() => ColorConstant.instance.dark0;
  static Color light() => ColorConstant.instance.light0;
}
