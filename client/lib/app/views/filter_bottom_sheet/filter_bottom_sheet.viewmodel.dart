import 'package:client/core/base/view_model/base_view_model.dart';

class FilterBottomSheetViewModel extends BaseViewModel {
  String _selectedCategory = "Sort";
  String get selectedCategory => _selectedCategory;

  set selectedCategory(String newValue) {
    _selectedCategory = newValue;
    notifyListeners();
  }
}
