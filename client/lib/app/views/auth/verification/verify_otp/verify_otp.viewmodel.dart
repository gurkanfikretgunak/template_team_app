import 'package:client/core/base/view_model/base_view_model.dart';

class VerifyOtpViewModel extends BaseViewModel {
  String _otpText = "";
  String get otpText => _otpText;

  set otpText(newValue) {
    _otpText = newValue;
    notifyListeners();
  }
}
