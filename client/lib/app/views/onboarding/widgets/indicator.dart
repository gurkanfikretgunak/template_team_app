import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class Indicator extends BaseView {
  final int positionIndex, currentIndex;
  const Indicator({
    super.key,
    required this.currentIndex,
    required this.positionIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: positionIndex == currentIndex
            ? ColorConstant.instance.light4
            : ColorConstant.instance.light0.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
