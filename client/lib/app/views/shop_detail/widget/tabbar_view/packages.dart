import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../l10n/app_l10n.dart';
import '../shop_tile.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> packages = [
      {"image": Assets.images.shop.shopDetail3.path, "name": L10n.of(context)!.massage},
      {"image": Assets.images.shop.shopDetail9.path, "name": L10n.of(context)!.skinCare},
      {"image": Assets.images.shop.shopDetail11.path, "name": L10n.of(context)!.haircut},
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: context.paddingNormal,
              child: ShopListWidget(
                imgPath: packages[index],
              ),
            ),
          );
        },
        childCount: packages.length,
      ),
    );
  }
}
