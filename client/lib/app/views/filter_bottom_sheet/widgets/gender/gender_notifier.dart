import 'package:client/app/l10n/app_l10n.dart';
import 'package:flutter/material.dart';

class GenderNotifier extends ChangeNotifier {
  bool isSelectedMen = false;
  bool isSelectedWomen = false;

  List<Map> genderFilterOptions(BuildContext context) {
    return [
      {
        "title": L10n.of(context)!.male,
        "isSelected": isSelectedMen,
      },
      {
        "title": L10n.of(context)!.female,
        "isSelected": isSelectedWomen,
      },
    ];
  }

  setChange(String title, BuildContext context) {
    switch (title) {
      case "Male":
        isSelectedMen = !isSelectedMen;
        notifyListeners();
        break;
      case "Female":
        isSelectedWomen = !isSelectedWomen;
        notifyListeners();
        break;
      case "Erkek":
        isSelectedMen = !isSelectedMen;
        notifyListeners();
        break;
      case "Kadın":
        isSelectedWomen = !isSelectedWomen;
        notifyListeners();
        break;

      default:
    }
  }

  clear(BuildContext context) {
    isSelectedMen = false;
    isSelectedWomen = false;
    notifyListeners();
  }
}
