import 'package:client/core/base/view_model/base_view_model.dart';

class ManageAddressViewModel extends BaseViewModel {
  List<String> countryList = <String>[
    'Türkiye',
  ];
  List<String> cityList = <String>[
    'Antalya',
    'İzmir',
  ];

  String _ddCityValue = 'Antalya';
  String get ddCityValue => _ddCityValue;
  set ddCityValue(newValue) {
    _ddCityValue = newValue;
    notifyListeners();
  }

  String _ddCountryValue = 'Türkiye';
  String get ddCountryValue => _ddCountryValue;
  set ddCountryValue(newValue) {
    _ddCountryValue = newValue;
    notifyListeners();
  }
}
