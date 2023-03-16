import 'package:client/core/model/booking_model.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/inputs/widgets/shop_cards/shop_card.dart';

class ShopSpeacialCard extends StatelessWidget {
  const ShopSpeacialCard({
    Key? key,
    required this.cardHeight,
    required this.cardWidth,
    required this.imageFlex,
    required this.imageWidth,
    required this.shopModel,
  }) : super(key: key);
  final double cardHeight;
  final double cardWidth;
  final ShopDetailData shopModel;
  final int imageFlex;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return ShopCard(
      shopModel: shopModel,
      imageFlex: imageFlex,
      cardHeight: cardHeight,
      cardWidth: cardWidth,
      imageWidth: imageWidth,
      isBig: true,
    );
  }

  buildShopCardImage(String location) {
    switch (location) {
      case 'Munich Center':
        return Assets.images.shop.shop1.path;
      case 'Moosach':
        return Assets.images.shop.shop2.path;
      case 'Pasing-Obermenzing':
        return Assets.images.shop.shop3.path;
      case 'Trudering/Riem':
        return Assets.images.shop.shop4.path;
      default:
        return Assets.images.shop.shop4.path;
    }
  }
}
