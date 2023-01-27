import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/custom_show_snack_bar.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/widgets.dart';

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

  TextEditingController addressTitleController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final List<Map> _addressList = [];
  List<Map> get addressList => _addressList;

  addAddress(Map newAddress, BuildContext context) {
    if (_addressList.isEmpty) {
      _addressList.add(newAddress);
      notifyListeners();
    } else {
      for (var element in _addressList) {
        if (element['addressTitle'] == newAddress['addressTitle']) {
          CustomShowSnackBar.showSnackBar(
              context, L10n.of(context)!.registeredAddress);
        } else {
          _addressList.add(newAddress);
          notifyListeners();
        }
      }
    }
  }

  editAddress(Map newAddress, index) {
    _addressList[index] = newAddress;
    notifyListeners();
  }

  removeAddress(int index) {
    _addressList.removeAt(index);
    notifyListeners();
  }
}
