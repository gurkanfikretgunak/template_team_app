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
  }) : super(key: key);
  final EdgeInsetsGeometry? padding;
  final String? text;
  final ButtonColor? borderSideColor;
  final VoidCallback? onPressed;
  final Widget? child;
  final ButtonSize? buttonSize;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: ButtonSizeLabel().size(buttonSize),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ButtonColorLabel().color(borderSideColor)),
        ),
        padding: padding ?? EdgeInsets.zero,
      ),
      child: child ??
          Text(
            text ?? '',
            style: ButtonSizeLabel().buttonStyle(buttonSize),
          ),
    );
  }
}
