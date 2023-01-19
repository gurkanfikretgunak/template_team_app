import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class AccountViewModel extends BaseViewModel {
  List<Map> accountItems(BuildContext context) {
    return [
      {
        "icon": Icons.favorite_border,
        "title": L10n.of(context)!.yourFavorites,
        "subTitle": L10n.of(context)!.yourFavoritesDesc
      },
      {
        "icon": Icons.payment,
        "title": L10n.of(context)!.payment,
        "subTitle": L10n.of(context)!.paymentDesc,
      },
      {
        "icon": Icons.library_books_outlined,
        "title": L10n.of(context)!.manageAddress,
        "subTitle": "",
      },
      {
        "icon": Icons.notifications_none,
        "title": L10n.of(context)!.notifications,
        "subTitle": L10n.of(context)!.notificationsDesc,
      },
      {
        "icon": Icons.work_outline_sharp,
        "title": L10n.of(context)!.registerAsPartner,
        "subTitle": L10n.of(context)!.registerAsPartnerDesc,
      },
      {
        "icon": Icons.info_outline_rounded,
        "title": L10n.of(context)!.about,
        "subTitle": L10n.of(context)!.aboutDesc,
      },
      {
        "icon": Icons.logout,
        "title": L10n.of(context)!.logout,
        "subTitle": "",
      },
    ];
  }
}
