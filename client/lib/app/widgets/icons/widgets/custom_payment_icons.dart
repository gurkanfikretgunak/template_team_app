import 'package:flutter/material.dart';

class CustomPaymentIcon extends StatelessWidget {
  const CustomPaymentIcon({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 24,
      child: Image.asset(imagePath),
    );
  }
}
