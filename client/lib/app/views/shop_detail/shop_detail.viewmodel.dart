import 'package:client/app/views/bookings/widgets/tabbar_view/tabbar_view.dart';
import 'package:client/app/views/bookings/widgets/tabbar_view/tabbar_view_type.dart';
import 'package:client/core/base/view_model/base_view_model.dart';

class ShopDetailViewModel extends BaseViewModel {
  String _selectedTab = "Recommended";
  String get selectedTab => _selectedTab;

  set selectedTab(String newValue) {
    _selectedTab = newValue;
    notifyListeners();
  }
}
