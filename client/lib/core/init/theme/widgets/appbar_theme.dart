import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBarTheme {
  static AppBarTheme appBarTheme() {
    return AppBarTheme(
      color: ColorConstant.instance.light4,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorConstant.instance.dark0,
      ),

      // titleTextStyle: TextStyle(
      //   color: ColorConstant.instance.dark0,
      //   fontSize: 20,
      // ),
    );
  }
}
