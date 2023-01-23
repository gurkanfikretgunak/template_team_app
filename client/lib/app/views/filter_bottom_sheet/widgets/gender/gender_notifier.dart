import 'package:client/app/l10n/app_l10n.dart';
import 'package:flutter/material.dart';

class GenderNotifier extends ChangeNotifier {
  List<Map> genderFilterOptions(BuildContext context) {
    return [
      {
        "title": L10n.of(context)!.male,
        "isSelected": false,
      },
      {
        "title": L10n.of(context)!.female,
        "isSelected": false,
      },
    ];
  }

  setChange(String title, BuildContext context) {
    switch (title) {
      case "Male":
        genderFilterOptions(context)[0]['isSelected'] =
            !genderFilterOptions(context)[0]['isSelected'];
        notifyListeners();
        break;
      case "Female":
        genderFilterOptions(context)[1]['isSelected'] =
            !genderFilterOptions(context)[1]['isSelected'];
        notifyListeners();
        break;

      default:
    }
  }

  // clear() {
  //   for (var element in genderFilterOptions(context)) {
  //     element['isSelected'] = false;
  //   }
  //   notifyListeners();
  // }
}
