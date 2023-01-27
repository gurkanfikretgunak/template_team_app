import 'package:client/app/views/shop_detail/widget/shop_tile.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../l10n/app_l10n.dart';

class FaceCareView extends StatelessWidget {
  const FaceCareView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> faceCare = [
      {"image": Assets.images.shop.shopDetail9.path, "name": L10n.of(context)!.charcoalDetoxMask},
      {"image": Assets.images.shop.shopDetail10.path, "name": L10n.of(context)!.clayMask},
      {"image": Assets.images.shop.shopDetail11.path, "name": L10n.of(context)!.skinCare},
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: context.paddingNormal,
              child: ShopListWidget(imgPath: faceCare[index]),
            ),
          );
        },
        childCount: faceCare.length,
      ),
    );
  }
}
