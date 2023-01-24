import 'package:client/app/widgets/custom_card.dart';
import 'package:client/app/widgets/inputs/widgets/shop_cards/shop_card_widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget with ShopCardWidgets {
  ShopCard({
    super.key,
    required this.cardHeight,
    required this.cardWidth,
    required this.imageFlex,
    this.imageWidth,
    required this.isBig,
    required this.shopModel,
  });

  final BookingModel shopModel;
  final double cardHeight;
  final double cardWidth;
  final int imageFlex;
  final double? imageWidth;
  final bool isBig;

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
          Expanded(flex: imageFlex, child: SizedBox(width: imageWidth, child: shopImage(shopModel.desc))),
          context.emptySizedHeightBoxLow,
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: shopInformation(
                    context,
                    shopModel.title,
                    shopModel.location,
                    shopModel.price,
                    shopModel.date,
                    shopModel.distance,
                    false,
                  ),
                ),
                isBig
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 30,
                        ))
                    : const SizedBox()
              ],
            ),
          ),
        ],
      )),
    );
  }
}
