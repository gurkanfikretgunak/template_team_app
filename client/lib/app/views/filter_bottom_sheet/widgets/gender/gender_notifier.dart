import 'package:flutter/material.dart';

class GenderNotifier extends ChangeNotifier {
  List<Map> genderFilterOptions = [
    {
      "title": "Male",
      "isSelected": false,
    },
    {
      "title": "Female",
      "isSelected": false,
    },
  ];

  setChange(String title) {
    switch (title) {
      case "Male":
        genderFilterOptions[0]['isSelected'] =
            !genderFilterOptions[0]['isSelected'];
        notifyListeners();
        break;
      case "Female":
        genderFilterOptions[1]['isSelected'] =
            !genderFilterOptions[1]['isSelected'];
        notifyListeners();
        break;

      default:
    }
  }

  clear() {
    for (var element in genderFilterOptions) {
      element['isSelected'] = false;
    }
    notifyListeners();
  }
}
