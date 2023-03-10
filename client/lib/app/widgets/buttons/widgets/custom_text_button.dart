import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    this.buttonSize = ButtonSize.medium,
    required this.text,
    this.padding,
    this.child,
    this.minimumSize,
    this.color,
    this.hasUnderline = false,
  }) : super(key: key);

  final String text;
  final bool hasUnderline;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final Widget? child;
  final Size? minimumSize;
  final ButtonSize? buttonSize;
  final ButtonColor? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        textStyle: TextStyle(
            decoration:
                hasUnderline ? TextDecoration.underline : TextDecoration.none),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: child ??
          Text(
            text,
            style: TextConstants.instance.button2.copyWith(
                color: ButtonColorLabel().color(color ?? ButtonColor.purple)),
          ),
    );
  }
}
