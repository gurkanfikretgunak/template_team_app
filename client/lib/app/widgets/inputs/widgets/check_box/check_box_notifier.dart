import 'package:flutter/material.dart';

class CheckboxNotifier extends ChangeNotifier {
  bool _isChecked = false;
  bool get isChecked => _isChecked;

  void toggleCheck() {
    _isChecked = !_isChecked;
    notifyListeners();
  }
}
