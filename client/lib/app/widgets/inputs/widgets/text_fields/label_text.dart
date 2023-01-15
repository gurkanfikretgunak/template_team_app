import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

enum LabelText {
  lowOpacity,
  highOpacity,
  required,
  notRequired,
}

class LabelTextLabel {
  LabelTextLabel();
  static Color lowOpacity() => ColorConstant.instance.light0;
  static Color highOpacity() => ColorConstant.instance.dark0;
  static String required(String labelText) => "$labelText *";
  static String notRequired(String labelText) => labelText;
}
