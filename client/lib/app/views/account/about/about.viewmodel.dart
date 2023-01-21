import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class AboutViewModel extends BaseViewModel {
  List<Map> accountItems(BuildContext context) {
    return [
      {
        "title": L10n.of(context)!.termsOfService,
        "onTap": () {},
      },
      {
        "title": L10n.of(context)!.privacyPolicy,
        "onTap": () {},
      },
      {
        "title": L10n.of(context)!.licenses,
        "onTap": () {},
      },
    ];
  }
}
