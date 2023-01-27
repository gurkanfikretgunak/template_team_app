import 'package:client/app/views/checkout/checkout.widgets.dart';
import 'package:client/app/views/checkout/widgets/checkout_body.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class CheckoutView extends BaseView with CheckoutWidgets {
  const CheckoutView(this.error, {super.key});

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
      body: const CheckoutBodyWidget(),
      errorBody: const Text('errorrrr'),
    );
  }
}
