import 'package:flutter/cupertino.dart';

class SignUpViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  PageController? pageController;
}
