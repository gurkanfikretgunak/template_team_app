import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/icons/icons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class OrderLists extends StatelessWidget {
  const OrderLists({
    super.key,
    this.hasBooking = false,
    this.isFavorite = false,
    this.title,
    this.desc,
    this.date,
    this.price,
    this.location,
    this.distance,
  });
  final String? title;
  final String? location;
  final String? distance;
  final String? desc;
  final String? date;
  final String? price;
  final bool hasBooking;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              direction: Axis.vertical,
              spacing: 4,
              children: [
                Text(title ?? 'Woodlands Hills Salon'),
                Row(
                  children: [
                    Text(location ?? 'Keira throughway'),
                    const DotIconWidget(),
                    Text(distance ?? '5.0 Kms'),
                  ],
                ),
                Text(desc ?? 'Haircut x 1 + Shave x 1'),
                Row(
                  children: [
                    Text(date ?? '8 Mar 2021'),
                    const DotIconWidget(),
                    Text(price ?? '\$102'),
                  ],
                ),
              ],
            ),
            CustomTextButton(
              onPressed: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isFavorite
                      ? const CustomIcon(imagePath: '../assets/icons/heart-full.png')
                      : const CustomIcon(imagePath: '../assets/icons/heart.png'),
                  isFavorite ? const Text('Remove') : const Text('Favorite'),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hasBooking
                  ? CustomTextButton(
                      onPressed: () {},
                      text: 'Cancel Booking',
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                    )
                  : const SizedBox.shrink(),
              CustomOutlinedButton(
                onPressed: () {},
                text: 'Reorder Booking',
                padding: const EdgeInsets.all(8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DotIconWidget extends StatelessWidget {
  const DotIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Icon(Icons.circle, size: 4),
    );
  }
}
