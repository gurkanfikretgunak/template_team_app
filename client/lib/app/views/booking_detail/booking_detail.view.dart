import 'package:client/app/views/booking_detail/booking_detail.widgets.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

import '../bookings/widgets/list_booking.dart';

class BookingDetailView extends BaseView with BookingDetailWidgets {
  const BookingDetailView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: appBar(context),
      body: body(context, MockShop.bookingList(context)[0]),
      errorBody: const Text('errorrrr'),
    );
  }
}
