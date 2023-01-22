import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/payments/payment_home/payment.widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class PaymentView extends BaseView with PaymentsWidgets {
  const PaymentView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: CustomAppbar(title: L10n.of(context)!.payment),
      body: body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
