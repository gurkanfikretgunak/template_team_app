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

  setChange(int index, BuildContext context) {
    switch (index) {
      case 0:
        timingFilterOptions(context)[0]['isSelected'] =
            !timingFilterOptions(context)[0]['isSelected'];
        notifyListeners();

        break;
      case 1:
        timingFilterOptions(context)[1]['isSelected'] =
            !timingFilterOptions(context)[1]['isSelected'];
        notifyListeners();
        break;
      case 2:
        timingFilterOptions(context)[2]['isSelected'] =
            !timingFilterOptions(context)[2]['isSelected'];
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
