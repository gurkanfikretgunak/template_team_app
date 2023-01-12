import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.foregroundColor,
    this.padding,
    this.child,
    this.shadowColor,
    this.minimumSize,
  }) : super(key: key);

  final String text;
  final Color? foregroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? shadowColor;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shadowColor: shadowColor,
        padding: padding,
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: child ??
          Text(
            text,
            style: TextStyle(
                color: textColor ?? ColorConstant.instance.purple2, fontSize: fontSize, fontWeight: fontWeight),
          ),
    );
  }
}
