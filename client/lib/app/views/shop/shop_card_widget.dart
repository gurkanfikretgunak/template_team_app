import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/home/home.widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../gen/assets.gen.dart';
import '../../widgets/inputs/widgets/shop_cards/shop_card.dart';

class ShopSpeacialCard extends StatelessWidget {
  const ShopSpeacialCard({
    Key? key,
    required this.cardHeight,
    required this.cardWidth,
    required this.imageFlex,
    required this.imageWidth,
  }) : super(key: key);
  final double cardHeight;
  final double cardWidth;

  final int imageFlex;
  final double imageWidth;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);

    var fake = Faker();
    return ShopCard(
      imageFlex: imageFlex,
      address: fake.address.city(),
      distance: fake.randomGenerator.integer(20).toDouble(),
      genderType: fake.person.random.string(20),
      hasDiscount: fake.randomGenerator.boolean(),
      imagePath: buildShopCardImage(provider.ddLocationValue),
      rating: fake.randomGenerator.integer(20).toDouble(),
      shopName: fake.company.name(),
      shopTypes: fake.company.name(),
      discountAmount: fake.randomGenerator.integer(20).toDouble(),
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
    }
  }
}
