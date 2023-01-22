import 'package:client/app/widgets/inputs/widgets/shop_cards/shop_card.dart';
import 'package:client/core/base/view_model/base_view_model.dart';

class ShopDetailViewModel extends BaseViewModel {
  String _selectedTab = "Recommended";
  String get selectedTab => _selectedTab;

  set selectedTab(String newValue) {
    _selectedTab = newValue;
    notifyListeners();
  }

  List<ShopCard> favoriteCard = [];

  void ratingIcon(bool isFavorite) {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
