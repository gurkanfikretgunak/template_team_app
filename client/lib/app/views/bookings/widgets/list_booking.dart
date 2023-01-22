import 'package:client/app/widgets/list_items/widgets/booking_card.dart';
import 'package:client/core/model/booking_model.dart';

class MockBooking {
  static List<BookingCard> bookingList = [
    BookingCard(
      booking: BookingModel(
        title: 'Woodlands Hills Salon',
        location: 'Keira throughway',
        distance: '5.0 Kms',
        desc: 'Haircut x 1 + Shave x 1',
        date: '8 Mar 2021',
        price: '\$102',
        isCancel: false,
      ),
    ),
    BookingCard(
      booking: BookingModel(
        title: ' Style Lounge Salon',
        location: 'Ranchview',
        distance: '3.8 Kms',
        desc: 'Charcoal Detox Mask',
        date: '8 Mar 2021',
        price: '\$120',
        isCancel: false,
      ),
    ),
    BookingCard(
      booking: BookingModel(
        title: 'Woodlands Hills Salon',
        location: 'Keira throughway',
        distance: '5.0 Kms',
        desc: 'Haircut x 1 + Shave x 1',
        date: '8 Mar 2021',
        price: '\$102',
        isCancel: false,
      ),
    ),
  ];
}
