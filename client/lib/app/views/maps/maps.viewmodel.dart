import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class MapsViewModel extends ChangeNotifier {
  bool shoulShowInput = false;

  void showButton() {
    shoulShowInput = !shoulShowInput;
    notifyListeners();
  }
}
