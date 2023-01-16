import 'package:client/core/constans/color_constants.dart';

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
}
