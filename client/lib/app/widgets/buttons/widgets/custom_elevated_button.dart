import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.buttonColor,
    this.child,
    this.buttonSize = ButtonSize.medium,
    this.textColor,
  }) : super(key: key);

  final String text;
  final ButtonColor? buttonColor;
  final ButtonColor? textColor;
  final VoidCallback? onPressed;
  final Widget? child;
  final ButtonSize? buttonSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: ButtonSizeLabel().size(buttonSize),
        padding: EdgeInsets.zero,
        backgroundColor: ButtonColorLabel().color(buttonColor),
      ),
      child: child ??
          Text(
            text,
            style: TextStyle(
              color: ButtonColorLabel().color(textColor),
              fontSize: ButtonSizeLabel().textSize(buttonSize),
            ),
          ),
    );
  }
}
