import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

enum Payments { apple, cash, payPal, visa, gift, credit }

class PaymentSelectLabel {
  PaymentSelectLabel();
  paymentIcons(paymentMethod) {
    switch (paymentMethod) {
      case Payments.apple:
        return Image.asset(Assets.icons.applePay.path);
      case Payments.cash:
        return Image.asset(Assets.icons.cash.path);
      case Payments.visa:
        return Image.asset(Assets.icons.visa.path);
      case Payments.gift:
        return Image.asset(Assets.icons.giftCard.path);
      case Payments.credit:
        return Image.asset(Assets.icons.creditCard.path);
    }
  }
}
