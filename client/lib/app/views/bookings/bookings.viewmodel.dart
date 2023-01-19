import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/core/model/booking_model.dart';

class BookingViewModel extends BaseViewModel {
  BookingModel _booking = BookingModel();
  BookingModel get booking => _booking;
  set booking(newValue) {
    _booking = newValue;
    notifyListeners();
  }

  // bool _isFavorite = false;
  // bool get isFavorite => _isFavorite;
  // set isFavorite(bool newValue) {
  //   _isFavorite = newValue;
  //   notifyListeners();
  // }
}
