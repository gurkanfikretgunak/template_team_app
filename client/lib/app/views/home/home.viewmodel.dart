import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  List<String> locationList = <String>[
    'Antalya',
    'Adana',
    'Adıyaman',
    'Afyon',
    'Ağrı',
    'Amasya',
    'Ankara',
  ];
  List<String> countryList = <String>[
    'Turkey',
    'England',
  ];
  List<String> englandList = <String>[
    'London',
    'Oxford',
  ];

  whichCountry(country) {
    switch (country) {
      case "Turkey":
        return locationList;
      case "England":
        return englandList;

      default:
        return locationList;
    }
  }

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

  String _countryLocationValue = 'Turkey';
  String get countryLocationValue => _countryLocationValue;
  set countryLocationValue(newValue) {
    _countryLocationValue = newValue;
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
