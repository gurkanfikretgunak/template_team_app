import 'package:client/core/model/booking_model.dart';
import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../l10n/app_l10n.dart';

class MockShop {
  static List<BookingModel> bookingList(BuildContext context) {
    return [
      BookingModel(
        title: 'Cosmo Life ${L10n.of(context)!.beautyCentre}',
        location: 'Yalı Evleri',
        distance: '5.0 Kms',
        desc: Assets.images.shop.shop1.path,
        date: '8 Mar 2021',
        price: '5.0',
        isCancel: false,
      ),
      BookingModel(
        title: ' Beauty Lounge Salon',
        location: 'İlkadım Kılıçdede',
        distance: '3.8 Kms',
        desc: Assets.images.shop.shop4.path,
        date: '8 Mar 2021',
        price: '5.0',
        isCancel: false,
      ),
      BookingModel(
        title: 'Classis & Lady  ${L10n.of(context)!.beautySalon}',
        location: 'Seyhan',
        distance: '5.0 Kms',
        desc: Assets.images.shop.shop2.path,
        date: '8 Mar 2021',
        price: '4.0',
        isCancel: false,
      ),
    ];
  }
}
