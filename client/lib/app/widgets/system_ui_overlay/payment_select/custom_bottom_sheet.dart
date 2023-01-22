import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/system_ui_overlay/payment_select/payment_list.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends BaseView {
  const BottomSheetWidget({
    super.key,
    required this.paymentMethods,
    required this.paymentName,
    required this.onPressed,
    required this.hasButton,
    required this.buttonOnPressed,
  });

  final List<Payments> paymentMethods;
  final List<String> paymentName;
  final List<VoidCallback> onPressed;
  final bool hasButton;
  final VoidCallback buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: paymentMethods.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading:
                    PaymentSelectLabel().paymentIcons(paymentMethods[index]),
                title: Text(paymentName[index]!),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: onPressed[index]);
          },
        ),
        hasButton!
            ? CustomElevatedButton(
                onPressed: buttonOnPressed,
                text: "show",
              )
            : const SizedBox()
      ],
    );
  }
}
