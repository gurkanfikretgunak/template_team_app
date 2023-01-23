import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class FilterBottomSheetViewModel extends BaseViewModel {
  int _selectedCategory = 0;
  int get selectedCategory => _selectedCategory;

  set selectedCategory(int newValue) {
    _selectedCategory = newValue;
    notifyListeners();
  }

  List filterCetegoryList(BuildContext context) {
    return [
      L10n.of(context)!.sort,
      L10n.of(context)!.offer,
      L10n.of(context)!.gender,
      L10n.of(context)!.timing,
    ];
  }
}
