import 'package:client/core/base/view_model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  List<String> locationList = <String>[
    'Munich Center',
    'Moosach',
    'Pasing-Obermenzing',
    'Trudering/Riem'
  ];

  String _ddLocationValue = 'Munich Center';
  String get ddLocationValue => _ddLocationValue;
  set ddLocationValue(newValue) {
    _ddLocationValue = newValue;
    notifyListeners();
  }

  String? ddGenderValue;

  setDropDownGenderValue(String newValue) {
    ddGenderValue = newValue;
    notifyListeners();
  }

  String? ddPriceValue;

  setDropDownPriceValue(String newValue) {
    ddPriceValue = newValue;
    notifyListeners();
  }
}
