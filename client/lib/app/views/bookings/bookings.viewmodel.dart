import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  List<BookingModel> favoriteBookings = [];

  void favBooking(BookingModel favBookShow, bool isFavorite) {
    if (isFavorite) {
      favoriteBookings.add(favBookShow);
      booking.isFavorite = true;
    } else {
      favoriteBookings.remove(favBookShow);
      booking.isFavorite = false;
    }
    notifyListeners();
  }

  bool isFavorite(BookingModel favBookShow) {
    return favoriteBookings.contains(favBookShow);
  }

  favoriteSetCache(favoriteMovies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('favorite', favoriteMovies);
  }

  favoriteGetCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    boolValue = prefs.getBool('favorite') ?? false;
    notifyListeners();
    return boolValue;
  }
}
