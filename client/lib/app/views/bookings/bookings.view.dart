import 'package:client/app/views/bookings/bookings.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class BookingsView extends BaseView with BookingsWidgets {
  const BookingsView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: appBar(),
      body: body(),
      errorBody: const Text('errorrrr'),
    );
  }
}
