import 'package:client/app/widgets/list_items/list_items_widget.dart';

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
        return const OrderLists();

      case TabBarViewType.unComing:
        return const OrderLists(hasBooking: true);

      case TabBarViewType.favorites:
        return const OrderLists(isFavorite: true);
    }
  }
}
