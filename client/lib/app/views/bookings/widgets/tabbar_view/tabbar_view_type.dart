import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/model/booking_model.dart';

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
        return BookingCard(
          booking: BookingModel(
            title: 'Woodlands Hills Salon',
            location: 'Keira throughway',
            distance: '5.0 Kms',
            desc: 'Haircut x 1 + Shave x 1',
            date: '8 Mar 2021',
            price: '\$102',
            isCancel: false,
            isFavorite: false,
          ),
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
            isFavorite: false,
          ),
        );

      case TabBarViewType.favorites:
        return BookingCard(
          booking: BookingModel(
            title: 'Woodlands Hills Salon',
            location: 'Keira throughway',
            distance: '5.0 Kms',
            desc: 'Haircut x 1 + Shave x 1',
            date: '8 Mar 2021',
            price: '\$102',
            isCancel: false,
            isFavorite: true,
          ),
        );
    }
  }
}
