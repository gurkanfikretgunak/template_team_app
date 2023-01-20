import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/views/bookings/widgets/list_booking.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/divider/divider_widgets.dart';

enum TabBarViewType {
  past,
  unComing,
  favorites,
}

class TabBarViewTypeLabel {
  TabBarViewTypeLabel();

  buildOrderCard(orderCardType) {
    switch (orderCardType) {
      case TabBarViewType.past:
        return ListView.builder(
          shrinkWrap: true,
          itemCount: MockBooking.bookingList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                MockBooking.bookingList[index],
                Padding(
                  padding: context.verticalPaddingNormal,
                  child: const CustomDivider(type: DividerType.dashed),
                )
              ],
            );
          },
        );

      case TabBarViewType.unComing:
        return BookingCard(
          booking: BookingModel(
            title: 'Woodlands Hills Salon',
            location: 'Keira throughway',
            distance: '5.0 Kms',
            desc: 'Haircut x 1 + Shave x 1',
            date: '8 Mar 2021',
            price: '\$102',
            isCancel: true,
          ),
        );

      case TabBarViewType.favorites:
        return Consumer<BookingViewModel>(builder: (context, value, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: value.favoriteBookings.length,
            itemBuilder: (context, index) {
              return BookingCard(booking: value.favoriteBookings[index]);
            },
          );
        });
    }
  }
}
