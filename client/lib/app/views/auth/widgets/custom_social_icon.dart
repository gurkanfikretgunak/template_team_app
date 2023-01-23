import 'package:client/app/views/auth/widgets/social_image_path.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/image_viewer/icons/icons_widgets.dart';

class CustomSocialIcon extends StatelessWidget {
  const CustomSocialIcon({
    Key? key,
    required this.imagePath,
    this.fit,
    this.alignment,
    this.height = IconSize.medium,
    this.width = IconSize.medium,
    required this.socialName,
  }) : super(key: key);

  final SocialPath? imagePath;
  final BoxFit? fit;
  final Alignment? alignment;
  final IconSize? height;
  final IconSize? width;
  final String socialName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: CustomOutlinedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              SocialPathLabel().paths(imagePath),
              alignment: alignment ?? Alignment.center,
              height: IconSizeLabel().height(height),
              width: IconSizeLabel().width(width),
            ),
            context.emptySizedWidthBoxNormal,
            Text(socialName,
                style: TextConstants.instance.button2.copyWith(
                    color: ButtonColorLabel().color(ButtonColor.purple)))
          ],
        ),
      ),
    );
  }
}
