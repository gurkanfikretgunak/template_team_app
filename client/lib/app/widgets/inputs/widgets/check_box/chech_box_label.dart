import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

enum ECheckBox {
  disable,
  enable,
  unselectedLight,
  unselectedDark,
}

class ECheckBoxLabel {
  ECheckBoxLabel();

  static Color unselectedDark() => ColorConstant.instance.purple2;
  static Color unselectedLight() => ColorConstant.instance.light4;
}
