import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/custom_icons.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class PaymentViewModel extends BaseViewModel {
  List<Map> accountItems(BuildContext context) {
    return [
      {
        "icon": Assets.icons.applePay.path,
        "title": L10n.of(context)!.applePay,
        "trailing": CustomTextButton(
            onPressed: () {},
            text: L10n.of(context)!.remove,
            color: ButtonColor.red),
        "onTap": () {},
      },
      {
        "icon": Assets.icons.cash.path,
        "title": L10n.of(context)!.cash,
        "trailing": const Icon(Icons.arrow_forward_ios_sharp, size: 15),
        "onTap": () {},
      },
      {
        "icon": Assets.icons.creditCard.path,
        "title": "4153 xxxx xxxxx 0981",
        "trailing": CustomTextButton(
            onPressed: () {},
            text: L10n.of(context)!.remove,
            color: ButtonColor.red),
        "onTap": () {},
      },
      {
        "icon": Assets.icons.addMethod.path,
        "title": L10n.of(context)!.addPaymentMehod,
        "trailing": const SizedBox(),
        "onTap": () {},
      },
    ];
  }
}
