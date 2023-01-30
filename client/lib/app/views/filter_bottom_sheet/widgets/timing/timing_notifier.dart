import 'package:flutter/material.dart';

import '../../../../l10n/app_l10n.dart';

class TimingNotifier extends ChangeNotifier {
  bool isSelectedMorning = false;
  bool isSelectedMid = false;
  bool isSelectedNight = false;
  List<Map> timingFilterOptions(BuildContext context) {
    return [
      {
        "title": L10n.of(context)!.morning,
        "subTitle": L10n.of(context)!.timingValues,
        "isSelected": isSelectedMorning,
      },
      {
        "title": L10n.of(context)!.midDay,
        "subTitle": L10n.of(context)!.timingValues,
        "isSelected": isSelectedMid,
      },
      {
        "title": L10n.of(context)!.night,
        "subTitle": L10n.of(context)!.timingValues,
        "isSelected": isSelectedNight,
      },
    ];
  }

  setChange(int index, BuildContext context) {
    switch (index) {
      case 0:
        isSelectedMorning = !isSelectedMorning;
        notifyListeners();

        break;
      case 1:
        isSelectedMid = !isSelectedMid;
        notifyListeners();
        break;
      case 2:
        isSelectedNight = !isSelectedNight;
        notifyListeners();
        break;
      default:
    }
  }

  clear(BuildContext context) {
    isSelectedMorning = false;
    isSelectedMid = false;
    isSelectedNight = false;
    notifyListeners();
  }
}
