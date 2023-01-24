import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/model/booking_model.dart';

class ShopDetailViewModel extends BaseViewModel {
  String _selectedTab = "Recommended";
  String get selectedTab => _selectedTab;

  set selectedTab(String newValue) {
    _selectedTab = newValue;
    notifyListeners();
  }

  bool selectedShop = false;
  double totalPrice = 0;
  int itemCount = 0;

  void selectedShopCard(int price) {
    selectedShop = true;
    totalPrice = totalPrice + price;
    itemCount += 1;

    notifyListeners();
  }

  List<BookingModel> favoriteShopDetail = [];

  void favShopDetail(BookingModel shopDetail, bool isFavorite) {
    if (isFavorite) {
      favoriteShopDetail.add(shopDetail);
    } else {
      favoriteShopDetail.remove(shopDetail);
    }
    notifyListeners();
  }

  bool isDetailFavorite(BookingModel shopDetail) {
    return favoriteShopDetail.contains(shopDetail);
  }

  List<Map> accountItems(BuildContext context) {
    return [
      {
        "icon": Icons.location_on_outlined,
        "text": L10n.of(context)!.directions,
        "onTap": () {},
      },
      {
        "icon": Icons.call,
        "text": L10n.of(context)!.call,
        "onTap": () {
          launch("tel:+1-555-010-999");
        },
      },
      {
        "icon": Icons.share,
        "text": L10n.of(context)!.share,
        "onTap": () {
          String text = '';
          String subject = '';
          Share.share("check out my website", subject: "Look what i made");
        },
      },
    ];
  }
}
