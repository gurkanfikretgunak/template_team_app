import 'package:flutter/material.dart';

import '../../../../../../../core/constans/color_constants.dart';

enum HelpText {
  on,
  off,
  lowOpacity,
  highOpacity,
}

class HelpTextLabel {
  HelpTextLabel();

  static String on(String helpTextLabelValue) => helpTextLabelValue;
  static String off() => '';
  static Color lowOpacity() => ColorConstant.instance.light0;
  static Color highOpacity() => ColorConstant.instance.dark0;
}
