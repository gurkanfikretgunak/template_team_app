import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AddCardViewModel extends BaseViewModel {
  List<Map> accountItems(BuildContext context) {
    return [
      {
        "icon": Assets.icons.applePay.path,
        "title": L10n.of(context)!.applePay,
        "onTap": () {},
      },
      {
        "icon": Assets.icons.creditCard.path,
        "title": L10n.of(context)!.creditCard,
        "onTap": () {},
      },
      {
        "icon": Assets.icons.giftCard.path,
        "title": L10n.of(context)!.giftCard,
        "onTap": () {},
      },
    ];
  }
}
