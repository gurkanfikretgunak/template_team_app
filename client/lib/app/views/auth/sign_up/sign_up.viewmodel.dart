import 'package:client/core/model/register/user_register_response.dart';
import 'package:client/core/services/retrofit/retrofit_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class SignUpViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool obscureText = false;

  TextEditingController nameText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController emailText = TextEditingController();

  void passwordVisibleCheck() {
    obscureText = !obscureText;
    notifyListeners();
  }

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  PageController? pageController;

  Future<UserRegisterResponse> register() async {
    const String phoneNumber = '5326748019';

    List<String>? fullNameList = _fullNameSplitter(nameText.text);

    UserRegisterResponse result = await RetrofitService.instance.register(
      fullNameList![0], //name
      fullNameList[1], //surname
      emailText.text,
      passwordText.text,
      phoneNumber,
    );
    Logger().d(
        '${result.message}. \naccessToken:${GetStorage().read('accessToken')}');

    return result;
  }
}

/// Returns [String name, String surname] or null
List<String>? _fullNameSplitter(String fullName) {
  final whitespaceRE = RegExp(r"\s+");
  List<String> nameTextControl =
      fullName.replaceAll(whitespaceRE, " ").trim().split(' ');

  int count = nameTextControl.length - 1;
  String name = nameTextControl.reduce((f, s) {
    if (s != nameTextControl[count]) return '$f $s';
    return f;
  });

  String surname = nameTextControl[count];
  return [name, surname];
}
