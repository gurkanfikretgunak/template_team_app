import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    this.customIconPath,
    super.key,
    this.title,
    this.subtitle,
    this.firstButtonText,
    this.firstOnPressed,
    this.secondButtonText,
    this.secondOnPressed,
  });
  final String? customIconPath;
  final String? title;
  final String? subtitle;
  final String? firstButtonText;
  final VoidCallback? firstOnPressed;
  final String? secondButtonText;
  final VoidCallback? secondOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFFF1F1F1),
            child: CustomIcon(
                imagePath: customIconPath ?? 'assets/icons/home.png'),
          ),
        ),
        Wrap(
          spacing: 8,
          direction: Axis.vertical,
          children: [
            Text(title ?? 'Help'),
            Text(subtitle ?? 'FAQ\'s, Links'),
            Wrap(
              spacing: 48,
              children: [
                CustomTextButton(
                  onPressed: firstOnPressed,
                  text: 'Delete',
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
                CustomTextButton(
                  onPressed: secondOnPressed,
                  text: 'Edit',
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
