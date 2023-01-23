import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
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
                Consumer<BookingViewModel>(
                  builder: (context, value, child) {
                    bool favoriteMovies = value.isFavorite(widget.booking);

                    return IconButton(
                        onPressed: () {
                          value.favBooking(widget.booking, !favoriteMovies);
                        },
                        icon: AnimatedCrossFade(
                          firstChild: Icon(
                            Icons.favorite,
                            color: ColorConstant.instance.purple2,
                          ),
                          secondChild: const Icon(Icons.favorite_border),
                          crossFadeState: favoriteMovies
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(seconds: 1),
                        ));
                  },
                ),
              ],
            )
          ],
        ),
        Padding(
            padding: context.onlyTopPaddingNormal,
            child: Row(
              children: [
                Expanded(
                  flex: widget.booking.isCancel! ? 2 : 4,
                  child: widget.booking.isCancel!
                      ? CustomOutlinedButton(
                          onPressed: () {},
                          text: L10n.of(context)!.cancel,
                          borderSideColor: ButtonColor.red,
                          buttonSize: ButtonSize.medium,
                        )
                      : const SizedBox(),
                ),
                context.emptySizedWidthBoxNormal,
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    child: CustomOutlinedButton(
                      onPressed: () {},
                      text: L10n.of(context)!.reorderBooking,
                      buttonSize: ButtonSize.medium,
                    ),
                  ),
                )
              ],
            )),
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
