import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/shop/widget/shop_card_widget.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:flutter/material.dart';

class ShopHomeWidgets {
  Widget body(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              NavigationService.instance.navigateToPage(Routes.shopDetail.name);
            },
            child: Padding(
              padding: context.paddingNormal,
              child: ShopSpeacialCard(
                imageFlex: 3,
                cardHeight: 260,
                cardWidth: context.dynamicWidth(0.3),
                imageWidth: 500,
                shopModel: ShopDetailData(
                  shop: Shop(
                    address: Address(),
                    name: "name",
                    phoneNumber: "1111111",
                    averageRating: 2,
                    genderPreference: "",
                    numRates: 2,
                    sId: "--",
                    serviceTypes: [],
                  ),
                ),
              ),
            ),
          );
        },
        childCount: 3,
      ),
    );
  }
}
