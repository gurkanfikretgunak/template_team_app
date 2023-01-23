import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/app/views/shop_detail/shop_detail.widget.dart';
import 'package:client/app/views/shop_detail/widget/sliver_shop_detail.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/widgets/checkout_button.dart';

class ShopDetailView extends BaseView with ShopDetailWidgets {
  const ShopDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      body: Stack(
        children: [
          SliverShopDetailWidget(
            shopModel: MockShop.bookingList[1],
          ),
          CheckoutButton(
            itemCount: 2,
            totalPrice: 449,
            onPressed: () => NavigationService.instance.navigateToPage(Routes.checkout.name),
          )
        ],
      ),
    );
  }
}
