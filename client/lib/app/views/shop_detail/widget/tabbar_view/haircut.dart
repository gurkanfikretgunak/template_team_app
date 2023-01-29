import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/shop_detail/widget/shop_service_custom_list_tile.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HairCutView extends StatelessWidget {
  const HairCutView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> hairCut = [
      {
        "image": Assets.images.shop.shopDetail2.path,
        "name": L10n.of(context)!.haircut
      },
      {
        "image": Assets.images.shop.shopDetail6.path,
        "name": L10n.of(context)!.shave
      },
      {
        "image": Assets.images.shop.shopDetail11.path,
        "name": L10n.of(context)!.skinCare
      },
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
                padding: context.paddingNormal,
                child: ShopServiceCustomListTile(
                  shopService: hairCut[index],
                  index: index,
                )),
          );
        },
        childCount: hairCut.length,
      ),
    );
  }
}
