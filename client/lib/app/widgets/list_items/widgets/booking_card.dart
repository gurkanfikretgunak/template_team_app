import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingCard extends StatefulWidget {
  const BookingCard({
    super.key,
    required this.booking,
  });
  final BookingModel booking;

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingViewModel>(context);

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
                Text(widget.booking.title!,
                    style: TextConstants.instance.label1
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16)),
                Row(
                  children: [
                    Text(widget.booking.location!,
                        style: TextConstants.instance.subtitle2
                            .copyWith(color: ColorConstant.instance.dark3)),
                    const DotIconWidget(),
                    Text(widget.booking.distance!,
                        style: TextConstants.instance.subtitle2
                            .copyWith(color: ColorConstant.instance.dark3)),
                  ],
                ),
                Text(widget.booking.desc!,
                    style: TextConstants.instance.subtitle2
                        .copyWith(color: ColorConstant.instance.dark3)),
                Row(
                  children: [
                    Text(widget.booking.date!,
                        style: TextConstants.instance.subtitle1
                            .copyWith(color: ColorConstant.instance.dark3)),
                    const DotIconWidget(),
                    Text(widget.booking.price!,
                        style: TextConstants.instance.subtitle1
                            .copyWith(color: ColorConstant.instance.dark3)),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.booking.isFavorite!
                          ? widget.booking.isFavorite = false
                          : widget.booking.isFavorite = true;
                    });
                  },
                  icon: Icon(widget.booking.isFavorite!
                      ? Icons.favorite
                      : Icons.favorite_outline),
                ),
                Text(
                  "Favorite",
                  style: TextStyle(color: ColorConstant.instance.purple2),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.booking.isCancel!
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
