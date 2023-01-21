import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ShopServiceCustomListTile extends StatelessWidget {
  const ShopServiceCustomListTile({
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: imgSize ?? 75,
          height: imgSize ?? 75,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    AssetImage(imgPath ?? Assets.images.shop.shopDetail2.path)),
            borderRadius: BorderRadius.all(Radius.circular(imgRadius ?? 8)),
          ),
        ),
        Expanded(
          child: Wrap(
            spacing: 8,
            direction: Axis.vertical,
            children: [
              Text(title ?? 'Haircut'),
              Text(subtitle ?? '\$40'),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 2,
                children: [
                  Icon(icon ?? Icons.access_time),
                  Text(time ?? '30 Mins'),
                ],
              )
            ],
          ),
        ),
        isSelected
            ? ProductCountButton(onRemove: () {}, productCount: 1, onAdd: () {})
            : CustomOutlinedButton(
                onPressed: () {},
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        L10n.of(context)!.select,
                        style: TextConstants.instance.label1
                            .copyWith(color: ColorConstant.instance.purple2),
                      ),
                      Icon(Icons.add, color: ColorConstant.instance.purple2),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
