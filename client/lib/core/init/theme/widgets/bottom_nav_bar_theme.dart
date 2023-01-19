import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarTheme {
  static BottomNavigationBarThemeData bottomNavBarTheme() {
    return BottomNavigationBarThemeData(
      unselectedItemColor: ColorConstant.instance.dark3,
      selectedItemColor: ColorConstant.instance.purple2,
      backgroundColor: ColorConstant.instance.light4,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: ColorConstant.instance.purple2,
      ),
    );
  }
}
