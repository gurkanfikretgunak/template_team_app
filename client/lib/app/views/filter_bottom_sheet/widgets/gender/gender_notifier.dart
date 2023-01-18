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
      case "Women":
        genderFilterOptions[0]['isSelected'] =
            !genderFilterOptions[0]['isSelected'];
        notifyListeners();
        break;
      case "Man":
        genderFilterOptions[1]['isSelected'] =
            !genderFilterOptions[1]['isSelected'];
        notifyListeners();
        break;

      default:
    }
  }
}
