import 'package:client/core/model/booking_model.dart';
import '../../../../gen/assets.gen.dart';

class MockShop {
  static List<BookingModel> bookingList = [
    BookingModel(
      title: 'Cosmo Life Güzellik Merkezi',
      location: 'Yalı evleri',
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
      title: 'Classis & Lady Güzellik Salonu',
      location: 'Seyhan',
      distance: '5.0 Kms',
      desc: Assets.images.shop.shop2.path,
      date: '8 Mar 2021',
      price: '4.0',
      isCancel: false,
    ),
  ];
}
