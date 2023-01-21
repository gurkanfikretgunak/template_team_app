import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class ShopListWidget extends StatelessWidget {
  const ShopListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.8),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: const [
              ShopServiceCustomListTile(),
              SizedBox(
                height: 20,
                child: CustomDivider(),
              )
            ],
          );
        },
      ),
    );
  }
}
