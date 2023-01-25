import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/core/model/booking_model.dart';

class BookingViewModel extends BaseViewModel {
  bool isSelect = false;
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

  void favBooking(BookingModel booking, bool isFavorite) {
    if (isFavorite) {
      favoriteBookings.add(booking);
    } else {
      favoriteBookings.remove(booking);
    }
    notifyListeners();
  }

  bool isFavorite(BookingModel booking) {
    return favoriteBookings.contains(booking);
  }
}
