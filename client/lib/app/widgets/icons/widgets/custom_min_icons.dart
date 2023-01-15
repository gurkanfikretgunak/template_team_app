import 'package:flutter/material.dart';

class CustomMinIcon extends StatelessWidget {
  const CustomMinIcon({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: Image.asset(imagePath),
    );
  }
}
