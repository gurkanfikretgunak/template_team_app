import 'package:client/app/views/shop/shop.widget.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../shop/widget/sliver_shop.dart';

class SeeAllNearView extends BaseView with ShopHomeWidgets {
  const SeeAllNearView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(context,
        body: SliverShopWidget(
          appBarText: "",
          searchText: "30 shops giving Popular near you",
          imagePath: Assets.images.shop.shopping.path,
        ));
  }
}
