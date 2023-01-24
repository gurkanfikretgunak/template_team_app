import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  List<String> locationList = <String>[
    'Adana',
    'Adıyaman',
    'Afyon',
    'Ağrı',
    'Amasya',
    'Ankara',
    'Antalya',
  ];
  List<Map> beautyServiceList(BuildContext context) {
    return [
      {
        "image": Assets.images.home.homeTemp1.path,
        "text": L10n.of(context)!.bleachForWomen,
      },
      {
        "image": Assets.images.home.homeTemp2.path,
        "text": L10n.of(context)!.waxingForWomen,
      },
      {
        "image": Assets.images.home.homeTemp3.path,
        "text": L10n.of(context)!.facialForWomen,
      },
      {
        "image": Assets.images.home.homeTemp4.path,
        "text": L10n.of(context)!.shaveForMen,
      },
      {
        "image": Assets.images.home.homeTemp5.path,
        "text": L10n.of(context)!.haircutForMen,
      },
      {
        "image": Assets.images.home.homeTemp1.path,
        "text": L10n.of(context)!.bleachForWomen,
      },
    ];
  }

  String _ddLocationValue = 'Antalya';
  String get ddLocationValue => _ddLocationValue;
  set ddLocationValue(newValue) {
    _ddLocationValue = newValue;
    notifyListeners();
  }

  String? ddGenderValue;

  setDropDownGenderValue(String newValue) {
    ddGenderValue = newValue;
    notifyListeners();
  }

  String? ddPriceValue;

  setDropDownPriceValue(String newValue) {
    ddPriceValue = newValue;
    notifyListeners();
  }
}
