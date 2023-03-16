import 'package:client/app/views/booking_detail/booking_detail.widgets.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:flutter/material.dart';

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
      body: body(
        context,
        ShopDetailData(
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
      errorBody: const Text('errorrrr'),
    );
  }
}
