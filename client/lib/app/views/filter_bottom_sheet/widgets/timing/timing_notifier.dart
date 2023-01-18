import 'package:flutter/material.dart';

class TimingNotifier extends ChangeNotifier {
  List<Map> timingFilterOptions = [
    {
      "title": "Morning",
      "subTitle": "6.00 PM - 10.00 PM",
      "isSelected": false,
    },
    {
      "title": "Mid Day",
      "subTitle": "6.00 PM - 10.00 PM",
      "isSelected": false,
    },
    {
      "title": "Night",
      "subTitle": "6.00 PM - 10.00 PM",
      "isSelected": false,
    },
  ];

  setChange(String title) {
    switch (title) {
      case "Morning":
        timingFilterOptions[0]['isSelected'] =
            !timingFilterOptions[0]['isSelected'];
        notifyListeners();
        break;
      case "Mid Day":
        timingFilterOptions[1]['isSelected'] =
            !timingFilterOptions[1]['isSelected'];
        notifyListeners();
        break;
      case "Night":
        timingFilterOptions[2]['isSelected'] =
            !timingFilterOptions[2]['isSelected'];
        notifyListeners();
        break;
      default:
    }
  }
}
