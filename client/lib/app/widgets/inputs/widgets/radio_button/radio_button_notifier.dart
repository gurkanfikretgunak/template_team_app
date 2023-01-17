import 'package:client/core/base/view_model/base_view_model.dart';

class RadioButtonNotifier extends BaseViewModel {
  dynamic selectedOption;

  setSelectedOption(dynamic option) {
    selectedOption = option;
    notifyListeners();
  }
}
