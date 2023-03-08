import 'package:client/core/model/login/user_login_response.dart';
import 'package:client/core/services/retrofit/retrofit_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  TextEditingController passwordText = TextEditingController();
  TextEditingController emailText = TextEditingController();

  Future<dynamic> login() async {
    if (passwordText.text != '' && emailText.text != '') {
      UserLoginResponse response = await RetrofitService.instance
          .login(emailText.text, passwordText.text);
      Logger().d(
          '${response.message}. \naccessToken:${GetStorage().read('accessToken')}');
      return response;
    } else {
      Logger().d("Fill the blanks!");
      return "hatalı";
    }
  }

  PageController? pageController;

  permissionSetCache(bool condition) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('permission', condition);
  }

  permissionGetCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool('permission') ?? false;
    return boolValue;
  }
}
