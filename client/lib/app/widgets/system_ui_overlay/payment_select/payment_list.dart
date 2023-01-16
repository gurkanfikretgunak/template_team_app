import 'package:flutter/material.dart';

enum Payments { apple, cash, payPal, visa, gift, credit }

class PaymentSelectLabel {
  PaymentSelectLabel();
  paymentIcons(paymentMethod) {
    switch (paymentMethod) {
      case Payments.apple:
        return Image.asset("apple-pay.png");
      case Payments.cash:
        return Image.asset("cash.png");
      case Payments.visa:
        return Image.asset("visa.png");
      case Payments.gift:
        return Image.asset("gift-card.png");
      case Payments.credit:
        return Image.asset("credit-card.png");
    }
  }
}
