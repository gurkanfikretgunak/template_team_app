import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    this.buttonSize = ButtonSize.medium,
    this.text,
    this.borderSideColor,
    this.child,
    this.padding,
    this.textColor,
  }) : super(key: key);
  final EdgeInsetsGeometry? padding;
  final String? text;
  final ButtonColor? borderSideColor;
  final ButtonColor? textColor;
  final VoidCallback? onPressed;
  final Widget? child;
  final ButtonSize? buttonSize;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: ButtonColorLabel().color(borderSideColor),
          width: 1.5,
        ),
        fixedSize: ButtonSizeLabel().size(buttonSize),
        padding: padding ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: child ??
          Text(
            text!,
            style: TextStyle(
              color: ButtonColorLabel().color(borderSideColor),
              fontSize: ButtonSizeLabel().textSize(buttonSize),
            ),
          ),
    );
  }
}
