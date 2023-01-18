import 'package:client/app/widgets/custom_card.dart';
import 'package:client/app/widgets/image_viewer/custom_viewer_image.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  ShopCard({
    super.key,
    // required this.genderType,
    // required this.shopName,
    // required this.imagePath,
    // required this.shopTypes,
    // required this.address,
    // required this.rating,
    // required this.distance,
    // required this.hasDiscount,
    // this.discountAmount,
  });

  // final String genderType, shopName, imagePath, address, shopTypes;
  // final double rating, distance;
  // final double? discountAmount;
  // final bool hasDiscount;

  final textConsts = TextConstants.instance;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageViewer(
          assetPath: Assets.images.salonTemp.path,
        ),
        Padding(
          padding: context.verticalPaddingLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FOR MEN & WOMEN",
                style: textConsts.label2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  "shopName",
                  style: textConsts.heading6,
                ),
              ),
              Row(
                children: [
                  Text(
                    "shopTypes",
                    style: textConsts.paragraph2,
                  ),
                  const DotIconWidget(),
                  Icon(
                    Icons.star_outline,
                    size: 16,
                    color: ColorConstant.instance.dark3,
                  ),
                  Text(
                    "rating".toString(),
                    style: textConsts.button3,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "address",
                    style: textConsts.paragraph2,
                  ),
                  const DotIconWidget(),
                  Text(
                    " distance",
                    style: textConsts.subtitle2,
                  ),
                  const DotIconWidget(),
                  Text(
                    '\$\$',
                    style: textConsts.subtitle2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
