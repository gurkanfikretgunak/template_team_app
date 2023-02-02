import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
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
