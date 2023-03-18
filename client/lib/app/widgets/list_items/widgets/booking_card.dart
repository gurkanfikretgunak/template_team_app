import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_bottom_sheet.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/navigation_service.dart';
import '../../../routes/routes.dart';
import '../../../views/account/widgets/alert_bottom_sheet.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.booking,
  });
  final ShopDetailData booking;

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
                Text(booking.shop!.name!,
                    style: TextConstants.instance.label1
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16)),
                Row(
                  children: [
                    Text(booking.shop!.address! as String,
                        style: TextConstants.instance.subtitle2
                            .copyWith(color: ColorConstant.instance.dark3)),
                    const DotIconWidget(),
                    Text(booking.shop!.numRates! as String,
                        style: TextConstants.instance.subtitle2
                            .copyWith(color: ColorConstant.instance.dark3)),
                  ],
                ),
                Text(booking.shop!.address! as String,
                    style: TextConstants.instance.subtitle2
                        .copyWith(color: ColorConstant.instance.dark3)),
                Row(
                  children: [
                    Text(booking.shop!.address!.city!,
                        style: TextConstants.instance.subtitle1
                            .copyWith(color: ColorConstant.instance.dark3)),
                    const DotIconWidget(),
                    Text(booking.shop!.address!.city!,
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
                    bool favoriteMovies = value.isFavorite(booking);

                    return IconButton(
                        onPressed: () {
                          value.favBooking(booking, !favoriteMovies);
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
                  flex: booking.isFavorited! ? 2 : 4,
                  child: booking.isFavorited!
                      ? CustomOutlinedButton(
                          onPressed: () {
                            CustomBottomSheet.buildCustomBottomSheet(
                              context: context,
                              widget: AlertBottomSheet(
                                title: L10n.of(context)!.isCancelBooking,
                                subTitle: L10n.of(context)!.isCancelBookingDesc,
                                redButtonText: L10n.of(context)!.cancel,
                                whiteButtonText: L10n.of(context)!.close,
                              ),
                            );
                          },
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
                      onPressed: () {
                        NavigationService.instance
                            .navigateToPage(Routes.bookingDetail.name);
                      },
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
