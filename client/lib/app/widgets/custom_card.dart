import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.child,
    this.color,
    this.elevation,
    this.height,
    this.width,
    this.margin,
    this.shadowColor,
    this.borderRadius,
    this.borderSideColor,
  }) : super(key: key);

  final Color? color;
  final Color? shadowColor;
  final Color? borderSideColor;
  final Widget child;
  final double? elevation;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 0,
      color: color,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: context.lowBorderRadius,
        side: BorderSide(
            width: 1.3,
            color: borderSideColor ?? ColorConstant.instance.transparent),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
