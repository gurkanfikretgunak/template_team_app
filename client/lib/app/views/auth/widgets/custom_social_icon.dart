import 'package:client/app/views/auth/widgets/social_image_path.dart';
import 'package:client/app/widgets/icons/widgets/icon_size.dart';
import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Image.asset(
          SocialPathLabel().paths(imagePath),
          alignment: alignment ?? Alignment.center,
          height: IconSizeLabel().height(height),
          width: IconSizeLabel().width(width),
        ),
        Text(socialName)
      ],
    );
  }
}
