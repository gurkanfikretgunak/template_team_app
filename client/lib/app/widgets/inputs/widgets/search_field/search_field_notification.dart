import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class SearchFieldNotifier extends BaseViewModel {
  TextEditingController searchController = TextEditingController();

  bool _active = false;
  bool get active => _active;

  set active(bool value) {
    _active = value;
    notifyListeners();
  }
}
