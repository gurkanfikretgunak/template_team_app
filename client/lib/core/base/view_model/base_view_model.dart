import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  final bool isLoading = false;
  final bool systemOverLay = false;

  bool changeIsLoading() {
    return isLoading != isLoading;
  }

  bool systemOverLayFunc() {
    return systemOverLay != systemOverLay;
  }
}

// class SplashViewModel extends BaseViewModel {}
