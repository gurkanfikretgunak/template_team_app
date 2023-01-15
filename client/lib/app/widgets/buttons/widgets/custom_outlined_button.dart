import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.borderSideColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final Color? borderSideColor;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderSideColor ?? ColorConstant.instance.purple2),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5)),
        ),
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style:
            TextStyle(color: textColor ?? ColorConstant.instance.purple2, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
