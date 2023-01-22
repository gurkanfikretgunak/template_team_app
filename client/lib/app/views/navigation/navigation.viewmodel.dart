import 'package:client/app/views/account/account_home/account.view.dart';
import 'package:client/app/views/bookings/bookings.view.dart';
import 'package:client/app/views/home/home.view.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

import '../search/search.view.dart';

class BottomNavBarViewModel extends BaseViewModel {
  List<Widget> pageOptions = <Widget>[
    const HomeView(false),
    const SearchView(false),
    const BookingsView(false),
    const AccountView(false),
  ];

  int _currentPage = 0;

  int get currentPage => _currentPage;

  changePage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
