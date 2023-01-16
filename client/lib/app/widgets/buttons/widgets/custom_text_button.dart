import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    this.buttonSize = ButtonSize.medium,
    this.text,
    this.padding,
    this.child,
    this.minimumSize,
  }) : super(key: key);

  final String? text;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final Widget? child;
  final Size? minimumSize;
  final ButtonSize? buttonSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: ButtonSizeLabel().size(buttonSize),
      ),
      onPressed: onPressed,
      child: child ?? Text(text ?? '', style: ButtonSizeLabel().buttonStyle(buttonSize)),
    );
  }
}
