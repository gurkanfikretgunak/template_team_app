import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTabBarTheme {
  static TabBarTheme tabbarTheme() {
    return TabBarTheme(
      labelColor: ColorConstant.instance.purple2,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
        color: ColorConstant.instance.purple2,
        width: 1.5,
      )),
    );
  }
}
