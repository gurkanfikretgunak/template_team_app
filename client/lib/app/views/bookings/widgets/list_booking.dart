import 'package:client/app/widgets/list_items/widgets/booking_card.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_l10n.dart';

class MockBooking {
  static List<BookingCard> bookingList(BuildContext context) {
    return [
      BookingCard(
        booking: BookingModel(
          title: 'Cosmo Life ${L10n.of(context)!.beautyCentre}',
          location: 'Yalı Evleri',
          distance: '5.0 Kms',
          desc: ' ${L10n.of(context)!.haircut} x 1 +  ${L10n.of(context)!.shave} x 1',
          date: '8 Mar 2021',
          price: '\$102',
          isCancel: false,
        ),
      ),
      BookingCard(
        booking: BookingModel(
          title: ' Beauty Lounge Salon',
          location: 'İlkadım Kılıçdede',
          distance: '3.8 Kms',
          desc: L10n.of(context)!.charcoalDetoxMask,
          date: '8 Mar 2021',
          price: '\$120',
          isCancel: false,
        ),
      ),
      BookingCard(
        booking: BookingModel(
          title: 'Classis & Lady  ${L10n.of(context)!.beautySalon}',
          location: 'Seyhan',
          distance: '5.0 Kms',
          desc: ' ${L10n.of(context)!.haircut} x 1 +  ${L10n.of(context)!.shave} x 1',
          date: '8 Mar 2021',
          price: '\$102',
          isCancel: false,
        ),
      ),
    ];
  }
}
