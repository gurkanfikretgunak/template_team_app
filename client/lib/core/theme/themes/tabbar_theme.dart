import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

class CustomTabBarTheme {
  static TabBarTheme tabbarTheme() {
    return TabBarTheme(
      labelColor: ColorConstant.instance.purple2,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: ColorConstant.instance.dark3,
      labelStyle: TextConstants.instance.label1,
      unselectedLabelStyle: TextConstants.instance.label1,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
        color: ColorConstant.instance.purple2,
        width: 2.5,
      )),
    );
  }
}
