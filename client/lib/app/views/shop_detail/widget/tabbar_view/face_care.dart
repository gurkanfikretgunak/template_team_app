import 'package:client/app/views/shop_detail/widget/shop_tile.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class FaceCareView extends StatelessWidget {
  const FaceCareView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: context.paddingNormal,
              child: const ShopListWidget(),
            ),
          );
        },
        childCount: 5,
      ),
    );
  }
}
