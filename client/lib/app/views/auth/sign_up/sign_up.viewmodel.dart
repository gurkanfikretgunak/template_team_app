import 'package:client/core/init/cache/token_cache_manager/token_cache_manager.dart';
import 'package:client/core/model/register/user_register_response.dart';
import 'package:client/core/network/retrofit/retrofit_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool obscureText = false;

  TextEditingController nameText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController emailText = TextEditingController();

  final TokenCacheManager tokenCacheManager = TokenCacheManager();
  void passwordVisibleCheck() {
    obscureText = !obscureText;
    notifyListeners();
  }

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  void register() async {
    const String phoneNumber = '5326748019';

    if (nameText.text.isNotEmpty &&
        passwordText.text.isNotEmpty &&
        emailText.text.isNotEmpty) {
      List<String>? fullNameList = _fullNameSplitter(nameText.text);

      if (fullNameList != null) {
        UserRegisterResponse result = await RetrofitService.instance.register(
          fullNameList[0], //name
          fullNameList[1], //surname
          emailText.text,
          passwordText.text,
          phoneNumber,
        );
        Logger().d(
            '${result.message}. \naccessToken:${tokenCacheManager.readItem('accessToken')}');
      } else {
        //TODO: Show error messages
        Logger().d("Fill the name textfield as full name!");
      }
    } else {
      Logger().d("Fill the blanks!");
    }
  }

  permissionSetCache(bool condition) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('permission', condition);
  }

  permissionGetCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool('permission') ?? false;
    return boolValue;
  }

  PageController? pageController;
}

/// Returns [String name, String surname] or null
List<String>? _fullNameSplitter(String name) {
  final whitespaceRE = RegExp(r"\s+");
  List<String> nameTextControl =
      name.replaceAll(whitespaceRE, " ").trim().split(' ');

  if (nameTextControl.length >= 2) {
    int count = nameTextControl.length - 1;
    String name = nameTextControl.reduce((f, s) {
      if (s != nameTextControl[count]) return '$f $s';
      return f;
    });

    String surname = nameTextControl[count];
    return [name, surname];
  }

  return null;
}
