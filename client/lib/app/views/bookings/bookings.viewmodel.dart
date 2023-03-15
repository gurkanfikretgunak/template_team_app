import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/core/init/cache/permission_cache_manager/permission_cache_manager.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';

class BookingViewModel extends BaseViewModel {
  bool isSelect = false;
  bool boolValue = false;

  BookingModel _booking = BookingModel();
  BookingModel get booking => _booking;
  set booking(newValue) {
    _booking = newValue;
    notifyListeners();
  }

  isSlected() {
    isSelect = true;
    notifyListeners();
  }

  List<ShopDetailData> favoriteBookings = [];

  void favBooking(ShopDetailData favBookShow, bool isFavorite) {
    if (isFavorite) {
      favoriteBookings.add(favBookShow);
      booking.isFavorite = true;
    } else {
      favoriteBookings.remove(favBookShow);
      booking.isFavorite = false;
    }
    notifyListeners();
  }

  bool isFavorite(ShopDetailData favBookShow) {
    return favoriteBookings.contains(favBookShow);
  }

  final PermissionCacheManager _permissionCacheManager =
      PermissionCacheManager();

  favoriteSetCache(favoriteMovies) {
    _permissionCacheManager.writeItem('favorite', favoriteMovies);
  }

  favoriteGetCache() {
    boolValue = _permissionCacheManager.readItem('favorite') ?? false;
    notifyListeners();
    return boolValue;
  }
}
