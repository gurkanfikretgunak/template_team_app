import 'package:client/app/widgets/divider/widgets/dashed_divider.dart';
import 'package:client/app/widgets/divider/widgets/divider_color.dart';
import 'package:client/app/widgets/divider/widgets/normal_divider.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.type = DividerType.normal,
    this.color,
  });
  final DividerType? type;
  final DividerColor? color;

  @override
  Widget build(BuildContext context) {
    return type == DividerType.normal
        ? DividerTypeLabel.normal(color: color)
        : DividerTypeLabel.dashed();
  }
}

enum DividerType {
  normal,
  dashed,
}

class DividerTypeLabel {
  DividerTypeLabel();

  static Widget normal({DividerColor? color}) => NormalDivider(color: color);
  static Widget dashed() => const DashedDivider();
}
