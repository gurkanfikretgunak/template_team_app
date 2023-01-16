import 'package:client/app/widgets/system_ui_overlay/payment_list.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends BaseView {
  const BottomSheetWidget(this.paymentMethods, this.paymentName, this.onPressed, {super.key});

  final List<Payments?> paymentMethods;
  final List<String?> paymentName;
  final List<VoidCallback?> onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: paymentMethods.length,
      itemBuilder: (context, index) {
        return ListTile(
            leading: PaymentSelectLabel().paymentIcons(paymentMethods[index]),
            title: Text(paymentName[index]!),
            onTap: onPressed[index]);
      },
    );
  }
}
