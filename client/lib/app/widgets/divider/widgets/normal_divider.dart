import 'package:client/app/widgets/divider/widgets/divider_color.dart';
import 'package:flutter/material.dart';

class NormalDivider extends StatelessWidget {
  const NormalDivider({
    super.key,
    this.color = DividerColor.highOpacity,
  });

  final DividerColor? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color == DividerColor.highOpacity
          ? DividerColorLabel.highOpacity()
          : DividerColorLabel.lowOpacity(),
      thickness: 1,
    );
  }
}
