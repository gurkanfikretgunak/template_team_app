import 'package:client/core/base/view_model/base_view_model.dart';

import '../../../core/model/booking_model.dart';

class ShopDetailViewModel extends BaseViewModel {
  String _selectedTab = "Recommended";
  String get selectedTab => _selectedTab;

  set selectedTab(String newValue) {
    _selectedTab = newValue;
    notifyListeners();
  }

  List<BookingModel> favoriteShopDetail = [];

  void favShopDetail(BookingModel shopDetail, bool isFavorite) {
    if (isFavorite) {
      favoriteShopDetail.add(shopDetail);
    } else {
      favoriteShopDetail.remove(shopDetail);
    }
    notifyListeners();
  }

  bool isDetailFavorite(BookingModel shopDetail) {
    return favoriteShopDetail.contains(shopDetail);
  }
}
