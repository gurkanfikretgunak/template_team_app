import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
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
                image: NetworkImage(
                    imgPath ?? 'https://picsum.photos/250?image=9')),
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
        // buttonText ?? 'Select'
        isSelected
            ? ProductCountButton(onRemove: () {}, productCount: 1, onAdd: () {})
            : CustomOutlinedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(buttonText ?? 'Select'),
                    const CustomIcon(
                      imagePath: '../assets/icons/plus.png',
                    )
                  ],
                ),
              ),
      ],
    );
  }
}
