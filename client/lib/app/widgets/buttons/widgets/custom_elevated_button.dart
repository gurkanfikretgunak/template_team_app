import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.borderSideColor,
    this.borderRadius,
    this.shadowColor,
    this.child,
    this.fontWeight,
    this.disabledBackgroundColor,
  }) : super(key: key);

  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final Color? shadowColor;
  final Color? borderSideColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? disabledBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: disabledBackgroundColor ?? ColorConstant.instance.purple2,
        elevation: 0,
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderSideColor ?? Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5)),
        ),
        padding: EdgeInsets.zero,
        backgroundColor: buttonColor,
      ),
      child: child ??
          Text(
            text,
            style: TextStyle(
                color: textColor ?? ColorConstant.instance.light4, fontSize: fontSize, fontWeight: fontWeight),
          ),
    );
  }
}
