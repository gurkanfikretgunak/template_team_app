import 'package:client/app/widgets/image_viewer/custom_viewer_image.dart';
import 'package:client/app/widgets/list_items/widgets/booking_card.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ShopCardWidgets {
  CustomImageViewer shopImage() {
    return CustomImageViewer(
      fit: BoxFit.fitWidth,
      assetPath: Assets.images.salonTemp.path,
    );
  }

  Widget shopInformation(BuildContext context, shopName, shopTypes, rating,
      address, discountAmount) {
    return FittedBox(
      child: Wrap(
        direction: Axis.vertical,
        spacing: 3,
        children: [
          Text(
            "FOR MEN & WOMEN",
            style: TextConstants.instance.subtitle1
                .copyWith(fontSize: 12, color: ColorConstant.instance.dark3),
          ),
          Text(shopName,
              style: TextConstants.instance.subtitle1
                  .copyWith(fontSize: 17, fontWeight: FontWeight.w600)),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              Text(shopTypes,
                  style: TextConstants.instance.subtitle2
                      .copyWith(color: ColorConstant.instance.dark3)),
              const DotIconWidget(),
              Icon(Icons.star_outline,
                  size: 16, color: ColorConstant.instance.dark3),
              Text(
                rating.toString(),
                style: TextConstants.instance.subtitle2
                    .copyWith(color: ColorConstant.instance.dark3),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                address,
                style: TextConstants.instance.subtitle2
                    .copyWith(color: ColorConstant.instance.dark3),
              ),
              const DotIconWidget(),
              Text(
                "${discountAmount.toString()} Kms",
                style: TextConstants.instance.subtitle2
                    .copyWith(color: ColorConstant.instance.dark3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
