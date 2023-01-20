import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/core/model/booking_model.dart';

class BookingViewModel extends BaseViewModel {
  BookingModel _booking = BookingModel();
  BookingModel get booking => _booking;
  set booking(newValue) {
    _booking = newValue;
    notifyListeners();
  }

  List<BookingModel> favoriteMovies = [];

  void favMovies(BookingModel movies, bool isFavorite) {
    if (isFavorite) {
      favoriteMovies.add(movies);
    } else {
      favoriteMovies.remove(movies);
    }
    notifyListeners();
  }

  bool isFavorite(BookingModel movies) {
    return favoriteMovies.contains(movies);
  }
}
