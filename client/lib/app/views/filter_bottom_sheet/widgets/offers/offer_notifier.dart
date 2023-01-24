import 'package:flutter/material.dart';

class OfferNotifier extends ChangeNotifier {
  List<Map> timingFilterOptions = [
    {
      "title": "%50",
      "isSelected": false,
    },
    {
      "title": "%40",
      "isSelected": false,
    },
    {
      "title": "%30",
      "isSelected": false,
    },
  ];

  setChange(String title, BuildContext context) {
    switch (title) {
      case "%50":
        timingFilterOptions[0]['isSelected'] =
            !timingFilterOptions[0]['isSelected'];
        notifyListeners();

        break;
      case "%40":
        timingFilterOptions[1]['isSelected'] =
            !timingFilterOptions[1]['isSelected'];
        notifyListeners();
        break;
      case "%30":
        timingFilterOptions[2]['isSelected'] =
            !timingFilterOptions[2]['isSelected'];
        notifyListeners();
        break;
      default:
    }
  }

  clear() {
    for (var element in timingFilterOptions) {
      element['isSelected'] = false;
    }
    notifyListeners();
  }
}
