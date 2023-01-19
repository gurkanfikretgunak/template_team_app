import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CircularService extends StatelessWidget {
  const CircularService({
    Key? key,
    required this.title,
    this.hasPrefixIcon,
    this.hasSuffixIcon,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final String title;
  final Color? backgroundColor, textColor;
  final bool? hasPrefixIcon, hasSuffixIcon;
  final Widget? prefixIcon, suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runAlignment: WrapAlignment.center,
          spacing: 5,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (hasPrefixIcon ?? false) prefixIcon ?? CustomIcon(imagePath: Assets.icons.offer.path),
            Text(
              title,
              style: TextStyle(
                color: textColor ?? Colors.black,
              ),
            ),
            if (hasSuffixIcon ?? false) suffixIcon ?? const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
