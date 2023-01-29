import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/shop/widget/shop_card_widget.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/core/extensions/common_extension.dart';
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
                shopModel: MockShop.bookingList(context)[index],
              ),
            ),
          );
        },
        childCount: 3,
      ),
    );
  }
}
