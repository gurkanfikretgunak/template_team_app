import 'package:client/app/widgets/custom_card.dart';
import 'package:client/app/widgets/inputs/widgets/shop_cards/shop_card_widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constans/color_constants.dart';
import '../../../../views/shop_detail/shop_detail.viewmodel.dart';

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

  final ShopDetailData shopModel;
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
          Expanded(
              flex: imageFlex,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: SizedBox(
                    width: imageWidth,
                    child: shopImage(
                        "https://netstorage.bloomingdales.com/netstorage/fashion/prod/images/projects/about-us/shopping/shopping-services/beauty-detail.jpg")),
              )),
          context.emptySizedHeightBoxLow,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: FittedBox(
                  child: shopInformation(
                    context,
                    shopModel.shop!.name!,
                    shopModel.shop!.address!.city ?? "",
                    shopModel.shop!.phoneNumber!,
                    shopModel.shop!.name!,
                    shopModel.shop!.averageRating!,
                    false,
                  ),
                ),
              ),
              isBig
                  ? Consumer<ShopDetailViewModel>(
                      builder: (context, value, child) {
                        bool favoriteShopDetail =
                            value.isDetailFavorite(shopModel);

                        return FittedBox(
                          child: IconButton(
                              onPressed: () {
                                value.favShopDetail(
                                    shopModel, !favoriteShopDetail);
                              },
                              icon: AnimatedCrossFade(
                                firstChild: Icon(
                                  Icons.favorite,
                                  color: ColorConstant.instance.purple2,
                                  size: 30,
                                ),
                                secondChild: const Icon(
                                  Icons.favorite_border,
                                  size: 30,
                                ),
                                crossFadeState: favoriteShopDetail
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(seconds: 1),
                              )),
                        );
                      },
                    )
                  : const SizedBox()
            ],
          ),
        ],
      )),
    );
  }
}
