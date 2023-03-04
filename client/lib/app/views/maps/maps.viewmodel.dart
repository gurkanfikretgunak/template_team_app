import 'package:flutter/material.dart';

class MapsViewModel extends ChangeNotifier {
  bool shoulShowInput = false;

  void showButton() {
    shoulShowInput = !shoulShowInput;
    notifyListeners();
  }
}
