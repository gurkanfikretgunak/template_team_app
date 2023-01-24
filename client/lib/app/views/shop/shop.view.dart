import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/shop/shop.widget.dart';
import 'package:client/app/views/shop/widget/sliver_shop.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class ShopView extends BaseView with ShopHomeWidgets {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(context,
        body: SliverShopWidget(
          appBarText: L10n.of(context)!.haircutForMen,
          searchText: L10n.of(context)!.resultSearch,
          imagePath: Assets.images.shop.homeShop1.path,
        ));
  }
}
