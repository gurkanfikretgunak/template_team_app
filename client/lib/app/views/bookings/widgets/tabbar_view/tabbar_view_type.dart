import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/views/bookings/widgets/list_booking.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_l10n.dart';
import '../../../account/favorites/favorites.widgets.dart';

enum TabBarViewType {
  past,
  unComing,
  favorites,
}

class TabBarViewTypeLabel {
  TabBarViewTypeLabel();

  buildOrderCard(orderCardType, BuildContext context) {
    switch (orderCardType) {
      case TabBarViewType.past:
        return ListView.builder(
          shrinkWrap: true,
          itemCount: MockBooking.bookingList(context).length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                MockBooking.bookingList(context)[index],
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
          booking: ShopDetailData(
              // title: 'Cosmo Life ${L10n.of(context)!.beautyCentre}',
              // location: 'Yalı Evleri',
              // distance: '5.0 Kms',
              // desc:
              //     ' ${L10n.of(context)!.haircut} x 1 +  ${L10n.of(context)!.shave} x 1',
              // date: '8 Mar 2021',
              // price: '\$102',
              // isCancel: false,
              ),
        );

      case TabBarViewType.favorites:
        return Consumer<BookingViewModel>(builder: (context, value, child) {
          return value.favoriteBookings.isEmpty
              ? FavoritesWidgets().favoriteListEmptyAlert(context)
              : ListView.builder(
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
