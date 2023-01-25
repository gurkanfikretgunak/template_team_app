import 'package:client/app/views/shop_detail/widget/shop_tile.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../l10n/app_l10n.dart';

class HairCutView extends StatelessWidget {
  const HairCutView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> hairCut = [
      {"image": Assets.images.shop.shopDetail2.path, "name": L10n.of(context)!.haircut},
      {"image": Assets.images.shop.shopDetail6.path, "name": L10n.of(context)!.shave},
      {"image": Assets.images.shop.shopDetail11.path, "name": L10n.of(context)!.skinCare},
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: context.paddingNormal,
              child: ShopListWidget(imgPath: hairCut[index]),
            ),
          );
        },
        childCount: hairCut.length,
      ),
    );
  }
}
