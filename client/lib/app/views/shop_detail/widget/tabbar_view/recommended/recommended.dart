import 'package:client/app/views/shop_detail/widget/tabbar_view/recommended/recommended.viewmodel.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:flutter/material.dart';

class RecommendedView extends StatelessWidget {
  const RecommendedView({
    super.key,
    required this.recommended,
  });

  final List<Recommends> recommended;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: recommended.length,
        (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: context.paddingNormal,
                  child: ShopServiceCustomListTile(
                    image: recommended[index].image,
                    name: recommended[index].name,
                    duration: recommended[index].duration,
                    cost: recommended[index].cost,
                    index: index,
                  ),
                ),
              ),
              Padding(
                padding: context.horizontalPaddingNormal,
                child: const CustomDivider(),
              )
            ],
          );
        },
      ),
    );
  }
}
