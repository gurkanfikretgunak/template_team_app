import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/favorite_icon.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
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
                Text(title ?? 'Woodlands Hills Salon',
                    style: TextConstants.instance.label1
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16)),
                Row(
                  children: [
                    Text(location ?? 'Keira throughway',
                        style: TextConstants.instance.subtitle2
                            .copyWith(color: ColorConstant.instance.dark3)),
                    const DotIconWidget(),
                    Text(distance ?? '5.0 Kms',
                        style: TextConstants.instance.subtitle2
                            .copyWith(color: ColorConstant.instance.dark3)),
                  ],
                ),
                Text(desc ?? 'Haircut x 1 + Shave x 1',
                    style: TextConstants.instance.subtitle2
                        .copyWith(color: ColorConstant.instance.dark3)),
                Row(
                  children: [
                    Text(date ?? '8 Mar 2021',
                        style: TextConstants.instance.subtitle1
                            .copyWith(color: ColorConstant.instance.dark3)),
                    const DotIconWidget(),
                    Text(price ?? '\$102',
                        style: TextConstants.instance.subtitle1
                            .copyWith(color: ColorConstant.instance.dark3)),
                  ],
                ),
              ],
            ),
            FavoriteIcon(isFavorite: isFavorite),
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
                      color: ButtonColor.red,
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: context.dynamicHeight(0.046),
                child: CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Reorder Booking',
                  buttonSize: ButtonSize.large,
                ),
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
      child: Icon(Icons.circle, size: 7),
    );
  }
}
