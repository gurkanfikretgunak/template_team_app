import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

enum DividerColor {
  lowOpacity,
  highOpacity,
}

class DividerColorLabel {
  DividerColorLabel();

  static Color lowOpacity() => ColorConstant.instance.dark4;
  static Color highOpacity() => ColorConstant.instance.dark2;
}
