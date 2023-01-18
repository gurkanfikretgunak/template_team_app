import 'package:client/app/widgets/custom_card.dart';
import 'package:client/app/widgets/inputs/widgets/shop_cards/shop_card_widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget with ShopCardWidgets {
  ShopCard({
    super.key,
    required this.genderType,
    required this.shopName,
    required this.imagePath,
    required this.shopTypes,
    required this.address,
    required this.rating,
    required this.distance,
    required this.hasDiscount,
    this.discountAmount,
  });

  final String genderType, shopName, imagePath, address, shopTypes;
  final double rating, distance;
  final double? discountAmount;
  final bool hasDiscount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      width: context.dynamicHeight(0.3),
      child: CustomCard(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: shopImage()),
          context.emptySizedHeightBoxLow,
          Expanded(
              child: shopInformation(
            context,
            shopName,
            shopTypes,
            rating,
            address,
            discountAmount,
          )),
        ],
      )),
    );
  }
}
