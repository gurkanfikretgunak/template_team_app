import 'package:client/core/base/view_model/base_view_model.dart';
import '../../../gen/assets.gen.dart';

class CheckoutDetailViewModel extends BaseViewModel {
  String selectedPayment = "";
  String selectedIcon = Assets.icons.applePay.path;
  paymentSelect(pay) {
    switch (pay) {
      case "Apple Pay":
        selectedPayment = "Apple Pay";
        selectedIcon = Assets.icons.applePay.path;

        notifyListeners();
        break;

      case "Cash":
        selectedPayment = "Cash";
        selectedIcon = Assets.icons.cash.path;
        notifyListeners();
        break;
      case "Visa":
        selectedPayment = "Visa";
        Assets.icons.visa.path;
        notifyListeners();
        break;
      default:
    }
  }
}
