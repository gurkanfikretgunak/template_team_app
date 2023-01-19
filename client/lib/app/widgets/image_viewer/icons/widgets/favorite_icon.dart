import 'package:client/app/widgets/image_viewer/icons/widgets/custom_icons.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/icon_size.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class FavoriteIcon extends BaseView {
  const FavoriteIcon({
    super.key,
    required this.isFavorite,
  });
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isFavorite
              ? CustomIcon(
                  imagePath: Assets.icons.heartFull.path,
                  iconColor: ColorConstant.instance.purple2,
                  height: IconSize.large,
                  width: IconSize.large,
                )
              : CustomIcon(
                  imagePath: Assets.icons.heart.path,
                  iconColor: ColorConstant.instance.purple2,
                  height: IconSize.large,
                  width: IconSize.large,
                ),
          isFavorite
              ? Text(
                  'Remove',
                  style: TextConstants.instance.label3,
                )
              : Text(
                  'Favorite',
                  style: TextStyle(color: ColorConstant.instance.purple2),
                ),
        ],
      ),
    );
  }
}
