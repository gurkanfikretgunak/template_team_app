import 'package:client/core/base/view_model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  List<String> locationList = <String>[
    'Munich Center',
    'Moosach',
    'Pasing-Obermenzing',
    'Trudering/Riem'
  ];

  String _dropdownValue = 'Munich Center';
  String get dropdownValue => _dropdownValue;
  set dropdownValue(newValue) {
    _dropdownValue = newValue;
    notifyListeners();
  }
}
