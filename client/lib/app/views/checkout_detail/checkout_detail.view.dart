import 'package:client/app/views/checkout_detail/checkout_detail.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class CheckoutDetailView extends BaseView with CheckoutDetailWidgets {
  const CheckoutDetailView(this.error, {super.key});

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
