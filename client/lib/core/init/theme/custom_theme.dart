import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/init/theme/theme_widgets.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData customLightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: ColorConstant.instance.light4,
      appBarTheme: CustomAppBarTheme.appBarTheme(),
      iconTheme: CustomIconTheme.iconTheme(),
      bottomNavigationBarTheme: CustomBottomNavBarTheme.bottomNavBarTheme(),
      elevatedButtonTheme: CustomElevatedButtonTheme.elevatedButtonTheme(),
      primaryColor: ColorConstant.instance.light0,
      tabBarTheme: CustomTabBarTheme.tabbarTheme(),
    );
  }
}
