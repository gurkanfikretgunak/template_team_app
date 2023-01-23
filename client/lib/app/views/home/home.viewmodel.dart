import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/gen/assets.gen.dart';

class HomeViewModel extends BaseViewModel {
  List<String> locationList = <String>[
    'Adana',
    'Adıyaman',
    'Afyon',
    'Ağrı',
    'Amasya',
    'Ankara',
    'Antalya',
  ];
  List<Map> beautyServiceList = [
    {
      "image": Assets.images.home.homeTemp1.path,
      "text": "Bleach for women",
    },
    {
      "image": Assets.images.home.homeTemp2.path,
      "text": "Waxing for women",
    },
    {
      "image": Assets.images.home.homeTemp3.path,
      "text": "Facial for women",
    },
    {
      "image": Assets.images.home.homeTemp4.path,
      "text": "Shave for men",
    },
    {
      "image": Assets.images.home.homeTemp5.path,
      "text": "Haircut for men",
    },
    {
      "image": Assets.images.home.homeTemp1.path,
      "text": "Bleach for women",
    },
  ];

  String _ddLocationValue = 'Antalya';
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
