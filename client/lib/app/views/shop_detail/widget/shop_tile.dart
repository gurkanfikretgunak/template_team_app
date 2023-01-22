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
    return Column(
      children: [
        const ShopServiceCustomListTile(),
        SizedBox(
          height: 5,
          child: Padding(
            padding: context.onlyTopPaddingNormal,
            child: const CustomDivider(),
          ),
        )
      ],
    );
  }
}
