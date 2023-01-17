import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

class BookingDateAndLocation extends StatelessWidget {
  const BookingDateAndLocation({
    super.key,
    required this.iconPath,
    required this.text,
  });

  final String iconPath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: [
        CustomIcon(imagePath: iconPath, width: IconSize.large),
        Text(text, style: TextConstants.instance.button1)
      ],
    );
  }
}
