import 'package:client/app/widgets/custom_text.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class BottomNavBarViewModel extends BaseViewModel {
  List<Widget> pageOptions = <Widget>[
    const CustomText("search"),
    const CustomText("booking"),
    const CustomText("account"),
  ];

  int _currentPage = 0;

  int get currentPage => _currentPage;

  changePage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
