import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../shop_tile.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

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
