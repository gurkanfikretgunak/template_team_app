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
        return const Size(157, 48);
      case ButtonSize.medium:
        return const Size(119, 40);
      case ButtonSize.small:
        return const Size(80, 32);

      default:
        return const Size(119, 40);
    }
  }

  double textSize(buttonSize) {
    switch (buttonSize) {
      case ButtonSize.large:
        return 16;
      case ButtonSize.medium:
        return 14;
      case ButtonSize.small:
        return 12;
      default:
        return 14;
    }
  }
}
