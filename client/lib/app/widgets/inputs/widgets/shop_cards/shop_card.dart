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
    required this.cardHeight,
    required this.cardWidth,
  });

  final String genderType, shopName, imagePath, address, shopTypes;
  final double rating, distance;
  final double? discountAmount;
  final bool hasDiscount;
  final double cardHeight;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      width: cardWidth,
      child: CustomCard(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 3, child: shopImage(imagePath)),
          context.emptySizedHeightBoxLow,
          Expanded(
            flex: 1,
            child: shopInformation(context, shopName, shopTypes, rating, address, discountAmount, false),
          ),
        ],
      )),
    );
  }
}
