import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/constans/color_constants.dart';

class CheckoutTile extends StatelessWidget {
  final String iconPath;
  final String text;
  final bool hasTrailing;
  final VoidCallback? onTap;
  const CheckoutTile({super.key, required this.iconPath, required this.text, this.onTap, this.hasTrailing = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomIcon(imagePath: iconPath, width: IconSize.large),
      title: Text(text, style: TextConstants.instance.button1),
      trailing: hasTrailing
          ? Icon(
              Icons.arrow_forward_ios,
              color: ColorConstant.instance.purple2,
              size: 20,
            )
          : null,
      onTap: onTap,
    );
  }
}
