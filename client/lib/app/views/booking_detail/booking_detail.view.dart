import 'package:client/app/views/booking_detail/booking_detail.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
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
      body: body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
