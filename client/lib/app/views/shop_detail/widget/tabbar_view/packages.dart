import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({
    super.key,
    required this.packages,
  });

  final List<Packages> packages;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
                padding: context.paddingNormal,
                child: ShopServiceCustomListTile(
                  image: packages[index].image,
                  name: packages[index].name,
                  duration: packages[index].duration,
                  cost: packages[index].cost,
                  index: index,
                )),
          );
        },
        childCount: packages.length,
      ),
    );
  }
}
