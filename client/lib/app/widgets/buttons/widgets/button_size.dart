import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

enum ButtonSize {
  large,
  medium,
  small,
}

class ButtonSizeLabel {
  ButtonSizeLabel();
  size(buttonSize) {
    switch (buttonSize) {
      case ButtonSize.large:
        return const Size(350, 48);
      case ButtonSize.medium:
        return const Size(119, 40);
      case ButtonSize.small:
        return const Size(80, 32);

      default:
        return const Size(119, 40);
    }
  }

  TextStyle buttonStyle(buttonSize) {
    switch (buttonSize) {
      case ButtonSize.large:
        return TextConstants.instance.button1;
      case ButtonSize.medium:
        return TextConstants.instance.button2;
      case ButtonSize.small:
        return TextConstants.instance.button3;
      default:
        return TextConstants.instance.button2;
    }
  }
}
