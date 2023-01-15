import 'package:client/app/widgets/buttons/custom_text_button.dart';
import 'package:client/app/widgets/icons/custom_payment_icons.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, this.paymentName, this.customIconPath, this.removeCard, this.isExistingCard = false});
  final String? customIconPath;
  final String? paymentName;
  final bool isExistingCard;
  final VoidCallback? removeCard;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaymentIcon(imagePath: customIconPath ?? '../assets/icons/gift-card.png'),
      title: Text(paymentName ?? 'Payment Name'),
      trailing: isExistingCard
          ? CustomTextButton(
              onPressed: removeCard,
              text: 'Remove',
              textColor: ColorConstant.instance.red0,
            )
          : const Icon(Icons.chevron_right),
    );
  }
}
