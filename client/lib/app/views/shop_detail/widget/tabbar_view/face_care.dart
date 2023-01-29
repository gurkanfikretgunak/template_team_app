import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class FaceCareView extends StatelessWidget {
  const FaceCareView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> faceCare = [
      {
        "image": Assets.images.shop.shopDetail9.path,
        "name": L10n.of(context)!.charcoalDetoxMask
      },
      {
        "image": Assets.images.shop.shopDetail10.path,
        "name": L10n.of(context)!.clayMask
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
                  shopService: faceCare[index],
                  index: index,
                )),
          );
        },
        childCount: faceCare.length,
      ),
    );
  }
}
