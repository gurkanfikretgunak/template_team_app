import 'package:client/core/constans/color_constants.dart';

enum ButtonColor { transparent, dark, green, red, purple, light, blue }

class ButtonColorLabel {
  ButtonColorLabel();

  color(buttonColor) {
    switch (buttonColor) {
      case ButtonColor.transparent:
        return ColorConstant.instance.transparent;
      case ButtonColor.dark:
        return ColorConstant.instance.dark4;
      case ButtonColor.light:
        return ColorConstant.instance.light4;
      case ButtonColor.green:
        return ColorConstant.instance.green0;
      case ButtonColor.red:
        return ColorConstant.instance.red0;
      case ButtonColor.purple:
        return ColorConstant.instance.purple2;
      case ButtonColor.blue:
        return ColorConstant.instance.blue0;
      default:
        return ColorConstant.instance.purple2;
    }
  }
}
