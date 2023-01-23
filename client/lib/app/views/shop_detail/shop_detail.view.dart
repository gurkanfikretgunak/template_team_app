import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/app/views/shop_detail/shop_detail.widget.dart';
import 'package:client/app/views/shop_detail/widget/sliver_shop_detail.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class ShopDetailView extends BaseView with ShopDetailWidgets {
  const ShopDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      body: SliverShopDetailWidget(
        shopModel: MockShop.bookingList[1],
      ),
    );
  }
}
