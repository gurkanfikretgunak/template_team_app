import 'package:flutter/material.dart';
 
class ColorConstant {
  static final ColorConstant _instance = ColorConstant._init();
  static ColorConstant get instance => _instance;
  ColorConstant._init();
 
  Color purple4 = const Color(0xFFCBBFFF);
  Color purple3 = const Color(0xFF9880FE);
  Color purple2 = const Color(0xFF6440FE);
  Color purple1 = const Color(0xFF3F13FE);
  Color purple0 = const Color(0xFF2C01E2);
 
  Color dark4 = const Color(0xFFC7C9D9);
  Color dark3 = const Color(0xFF8F90A6);
  Color dark2 = const Color(0xFF555770);
  Color dark1 = const Color(0xFF28293D);
  Color dark0 = const Color(0xFF1C1C28);
 
  Color light4 = const Color(0xFFFFFFFF);
  Color light3 = const Color(0xFFFAFAFC);
  Color light2 = const Color(0xFFF2F2F5);
  Color light1 = const Color(0xFFEBEBF0);
  Color light0 = const Color(0xFFE4E4EB);
 
  Color orange4 = const Color(0xFFFFF8E5);
  Color orange3 = const Color(0xFFFCCC75);
  Color orange2 = const Color(0xFFFDAC42);
  Color orange1 = const Color(0xFFFF8800);
  Color orange0 = const Color(0xFFE57A00);
 
  Color blue4 = const Color(0xFFE5F0FF);
  Color blue3 = const Color(0xFF9DBFF9);
  Color blue2 = const Color(0xFF5B8DEF);
  Color blue1 = const Color(0xFF0063F7);
  Color blue0 = const Color(0xFF004FC4);
 
  Color yellow4 = const Color(0xFFFFFEE5);
  Color yellow3 = const Color(0xFFFDED72);
  Color yellow2 = const Color(0xFFFDDD48);
  Color yellow1 = const Color(0xFFFFCC00);
  Color yellow0 = const Color(0xFFE5B800);
 
  Color green4 = const Color(0xFFE3FFF1);
  Color green3 = const Color(0xFF57EBA1);
  Color green2 = const Color(0xFF39D98A);
  Color green1 = const Color(0xFF06C270);
  Color green0 = const Color(0xFF05A660);
 
  Color red4 = const Color(0xFFFFE5E5);
  Color red3 = const Color(0xFFFF8080);
  Color red2 = const Color(0xFFFF5C5C);
  Color red1 = const Color(0xFFFF3B3B);
  Color red0 = const Color(0xFFE53535);

  Color shadowFront = const Color(0xFF28293D);
  Color shadowBack = const Color(0xFF606170);

  Color transparent = const Color(0x00000000);
}