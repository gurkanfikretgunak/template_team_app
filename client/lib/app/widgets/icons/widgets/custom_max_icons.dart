import 'package:flutter/material.dart';

class CustomMaxIcon extends StatelessWidget {
  const CustomMaxIcon({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Image.asset(imagePath),
    );
  }
}
