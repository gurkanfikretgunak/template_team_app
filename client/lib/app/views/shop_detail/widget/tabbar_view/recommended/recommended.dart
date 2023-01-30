import 'package:client/app/views/shop_detail/widget/tabbar_view/recommended/recommended.viewmodel.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class RecommendedView extends StatelessWidget {
  const RecommendedView({super.key});

  @override
  Widget build(BuildContext context) {
    RecommendedViewModel vm = RecommendedViewModel();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: vm.recommendList(context).length,
        (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: context.paddingNormal,
                  child: ShopServiceCustomListTile(
                    shopService: vm.recommendList(context)[index],
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
