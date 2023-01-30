import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

import 'widgets/drop_down/mock_image_list.dart';

class HomeViewModel extends BaseViewModel {
  List<Map> beautyServiceList(BuildContext context, List<String> imagePath) {
    return [
      {
        "image": imagePath[0],
        "text": L10n.of(context)!.bleachForWomen,
      },
      {
        "image": imagePath[1],
        "text": L10n.of(context)!.waxingForWomen,
      },
      {
        "image": imagePath[2],
        "text": L10n.of(context)!.facialForWomen,
      },
      {
        "image": imagePath[3],
        "text": L10n.of(context)!.shaveForMen,
      },
      {
        "image": imagePath[4],
        "text": L10n.of(context)!.haircutForMen,
      },
      {
        "image": imagePath[0],
        "text": L10n.of(context)!.bleachForWomen,
      },
    ];
  }

  buildShopCardImage(String location, BuildContext context) {
    switch (location) {
      case 'Antalya':
        return beautyServiceList(context, imagePath1);
      case 'Adana':
        return beautyServiceList(context, imagePath2);
      case 'Adıyaman':
        return beautyServiceList(context, imagePath3);
      case 'Ankara':
        return beautyServiceList(context, imagePath3);
      default:
        return beautyServiceList(context, imagePath1);
    }
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
