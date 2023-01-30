import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/account/payments/payment_home/payment.viewmodel.dart';
import 'package:client/app/views/account/widgets/alert_bottom_sheet.dart';
import 'package:client/app/widgets/custom_bottom_sheet.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class AccountViewModel extends BaseViewModel {
  List<Map> accountItems(BuildContext context) {
    return [
      {
        "icon": Icons.favorite_border,
        "title": L10n.of(context)!.yourFavorites,
        "subTitle": L10n.of(context)!.yourFavoritesDesc,
        "onTap": () {
          NavigationService.instance.navigateToPage(Routes.favorites.name);
        },
      },
      {
        "icon": Icons.payment,
        "title": L10n.of(context)!.payment,
        "subTitle": L10n.of(context)!.paymentDesc,
        "onTap": () {
          NavigationService.instance.navigateToPage(Routes.payment.name);
        },
      },
      {
        "icon": Icons.library_books_outlined,
        "title": L10n.of(context)!.manageAddress,
        "subTitle": "",
        "onTap": () {
          NavigationService.instance.navigateToPage(Routes.manageAddress.name);
        },
      },
      {
        "icon": Icons.notifications_none,
        "title": L10n.of(context)!.notifications,
        "subTitle": L10n.of(context)!.notificationsDesc,
        "onTap": () {},
      },
      {
        "icon": Icons.work_outline_sharp,
        "title": L10n.of(context)!.registerAsPartner,
        "subTitle": L10n.of(context)!.registerAsPartnerDesc,
        "onTap": () {},
      },
      {
        "icon": Icons.info_outline_rounded,
        "title": L10n.of(context)!.about,
        "subTitle": L10n.of(context)!.aboutDesc,
        "onTap": () {
          NavigationService.instance.navigateToPage(Routes.about.name);
        },
      },
      {
        "icon": Icons.logout,
        "title": L10n.of(context)!.logout,
        "subTitle": "",
        "onTap": () {
          logoutBottomSheet(context);
        }
      },
    ];
  }

  logoutBottomSheet(BuildContext context) {
    return CustomBottomSheet.buildCustomBottomSheet(
      context: context,
      widget: AlertBottomSheet(
        title: L10n.of(context)!.isLogout,
        subTitle: L10n.of(context)!.logoutDesc,
        redButtonText: L10n.of(context)!.logout,
        whiteButtonText: L10n.of(context)!.cancel,
      ),
    );
  }
}
