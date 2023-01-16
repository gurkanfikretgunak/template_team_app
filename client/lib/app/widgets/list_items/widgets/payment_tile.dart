import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/icons/icons_widgets.dart';
import 'package:flutter/material.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile(
      {super.key,
      this.paymentName,
      this.customIconPath,
      this.removeCard,
      this.isExistingCard = false});
  final String? customIconPath;
  final String? paymentName;
  final bool isExistingCard;
  final VoidCallback? removeCard;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomIcon(
          imagePath: customIconPath ?? '../assets/icons/gift-card.png'),
      title: Text(paymentName ?? 'Payment Name'),
      trailing: isExistingCard
          ? CustomTextButton(
              onPressed: removeCard,
              text: 'Remove',
            )
          : const Icon(Icons.chevron_right),
    );
  }
}
