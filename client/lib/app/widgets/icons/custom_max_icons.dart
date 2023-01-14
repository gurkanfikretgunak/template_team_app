import 'package:flutter/material.dart';

class CustomMaxIcon extends StatelessWidget {
  const CustomMaxIcon({
    Key? key,
    this.imagePath,
    this.iconColor,
  }) : super(key: key);

  final String? imagePath;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: imagePath == null
          ? const SizedBox()
          : Image.asset(
              imagePath!,
              color: iconColor,
            ),
    );
  }
}
