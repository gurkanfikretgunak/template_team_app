import 'package:client/app/widgets/list_items/widgets/booking_card.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_l10n.dart';

class MockBooking {
  static List<BookingCard> bookingList(BuildContext context) {
    return [
      BookingCard(
        booking: ShopDetailData(
          shop: Shop(
            address: Address(),
            name: "name",
            phoneNumber: "1111111",
            averageRating: 2,
            genderPreference: "",
            numRates: 2,
            sId: "--",
            serviceTypes: [],
          ),
        ),
      ),
      BookingCard(
        booking: ShopDetailData(
          shop: Shop(
            address: Address(),
            name: "name",
            phoneNumber: "1111111",
            averageRating: 2,
            genderPreference: "",
            numRates: 2,
            sId: "--",
            serviceTypes: [],
          ),
        ),
      ),
      BookingCard(
        booking: ShopDetailData(
          shop: Shop(
            address: Address(),
            name: "name",
            phoneNumber: "1111111",
            averageRating: 2,
            genderPreference: "",
            numRates: 2,
            sId: "--",
            serviceTypes: [],
          ),
        ),
      ),
    ];
  }
}
