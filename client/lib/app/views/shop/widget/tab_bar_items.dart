import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class ShopListWidget extends StatelessWidget {
  const ShopListWidget({
    super.key,
    this.imgSize,
    this.imgPath,
    this.imgRadius,
    this.icon,
    this.title,
    this.subtitle,
    this.time,
    this.buttonText,
    this.onPressed,
    this.isSelected = false,
  });
  final double? imgSize;
  final String? imgPath;
  final double? imgRadius;
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final String? time;
  final String? buttonText;
  final Function()? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingHigh,
      child: SizedBox(
        width: context.dynamicWidth(0.85),
        height: context.dynamicHeight(0.5),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: const [
                ShopServiceCustomListTile(),
                SizedBox(
                  height: 10,
                  child: CustomDivider(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
