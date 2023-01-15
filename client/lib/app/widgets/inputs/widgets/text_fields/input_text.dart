import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

enum InputText {
  lowOpacity,
  highOpacity,
}

class InputTextLabel {
  InputTextLabel();
  static Color lowOpacity() => ColorConstant.instance.light0;
  static Color highOpacity() => ColorConstant.instance.dark0;
}
