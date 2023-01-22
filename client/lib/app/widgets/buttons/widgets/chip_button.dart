import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class ChipButton extends BaseView {
  const ChipButton({
    super.key,
    required this.widget,
    this.isBorder = false,
    required this.onTap,
    this.height,
    this.color,
  });

  final Widget widget;
  final bool? isBorder;
  final VoidCallback onTap;
  final Color? color;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: color ?? ColorConstant.instance.light2,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            color: isBorder! ? ColorConstant.instance.purple2 : ColorConstant.instance.transparent,
          ),
        ),
        child: Padding(
          padding: context.horizontalPaddingLow,
          child: Center(
            child: widget,
          ),
        ),
      ),
    );
  }
}
