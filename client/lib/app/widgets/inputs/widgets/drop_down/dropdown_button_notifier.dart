import 'package:client/core/base/view_model/base_view_model.dart';

class DropDownButtonNotifier extends BaseViewModel {
  //Get-Set kullandığımda dropdown'da bir sorun yaşıyordum bu şekilde kullanınca çözebildim.
  String? dropDownSelectedValue;

  setDropDownSelectedValue(String newValue) {
    dropDownSelectedValue = newValue;
    notifyListeners();
  }
}
