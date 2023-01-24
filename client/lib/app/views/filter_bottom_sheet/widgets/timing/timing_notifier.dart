import 'package:flutter/material.dart';

import '../../../../l10n/app_l10n.dart';

class TimingNotifier extends ChangeNotifier {
  List<Map> timingFilterOptions(BuildContext context) {
    return [
      {
        "title": L10n.of(context)!.morning,
        "subTitle": L10n.of(context)!.timingValues,
        "isSelected": false,
      },
      {
        "title": L10n.of(context)!.midDay,
        "subTitle": L10n.of(context)!.timingValues,
        "isSelected": false,
      },
      {
        "title": L10n.of(context)!.night,
        "subTitle": L10n.of(context)!.timingValues,
        "isSelected": false,
      },
    ];
  }

  setChange(String title, BuildContext context) {
    switch (title) {
      case "Morning":
        timingFilterOptions(context)[0]['isSelected'] = !timingFilterOptions(context)[0]['isSelected'];
        notifyListeners();

        break;
      case "Mid Day":
        timingFilterOptions(context)[1]['isSelected'] = !timingFilterOptions(context)[1]['isSelected'];
        notifyListeners();
        break;
      case "Night":
        timingFilterOptions(context)[2]['isSelected'] = !timingFilterOptions(context)[2]['isSelected'];
        notifyListeners();
        break;
      default:
    }
  }

  clear(BuildContext context) {
    for (var element in timingFilterOptions(context)) {
      element['isSelected'] = false;
    }
    notifyListeners();
  }
}
