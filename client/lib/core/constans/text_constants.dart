import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/cupertino.dart';

class TextConstants {
  static TextConstants? _instance;
  TextConstants._();
  static TextConstants get instance {
    _instance ??= TextConstants._();
    return _instance!;
  }
  //Font Weight
  //w100-thin
  //w200-extra-light
  //w300-light
  //w400-regular
  //w500-medium
  //w600-semibold
  //w700-bold
  //w800-extra-bold
  //w900-black

  //Heading
  TextStyle get heading1 => TextStyle(
        fontSize: 93,
        fontWeight: FontWeight.w300,
        color: ColorConstant.instance.dark0,
      );

  set heading1(TextStyle style) {
    heading1 = style;
  }

  TextStyle get heading2 => TextStyle(
        fontSize: 58,
        fontWeight: FontWeight.w300,
        color: ColorConstant.instance.dark0,
      );

  set heading2(TextStyle style) {
    heading2 = style;
  }

  TextStyle get heading3 => TextStyle(
        fontSize: 46,
        fontWeight: FontWeight.w400,
        color: ColorConstant.instance.dark0,
      );

  set heading3(TextStyle style) {
    heading3 = style;
  }

  TextStyle get heading4 => TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w400,
        color: ColorConstant.instance.dark0,
      );
  set heading4(TextStyle style) {
    heading4 = style;
  }

  TextStyle get heading5 => TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w400,
        color: ColorConstant.instance.dark0,
      );

  set heading5(TextStyle style) {
    heading5 = style;
  }

  TextStyle get heading6 => TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        color: ColorConstant.instance.dark0,
      );

  set heading6(TextStyle style) {
    heading6 = style;
  }

  //Subtitle
  TextStyle get subtitle1 => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: ColorConstant.instance.dark0,
      );

  set subtitle1(TextStyle style) {
    subtitle1 = style;
  }

  TextStyle get subtitle2 => TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: ColorConstant.instance.dark0,
      );

  set subtitle2(TextStyle style) {
    subtitle2 = style;
  }

  //Paragraph
  TextStyle get paragraph1 => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: ColorConstant.instance.dark0,
      );

  set paragraph1(TextStyle style) {
    paragraph1 = style;
  }

  TextStyle get paragraph2 => TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: ColorConstant.instance.dark0,
      );

  set paragraph2(TextStyle style) {
    paragraph2 = style;
  }

  //Button
  TextStyle get button1 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ColorConstant.instance.dark0,
      );

  set button1(TextStyle style) {
    heading1 = style;
  }

  TextStyle get button2 => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ColorConstant.instance.dark0,
      );

  set button2(TextStyle style) {
    heading1 = style;
  }

  TextStyle get button3 => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: ColorConstant.instance.dark0,
      );

  set button3(TextStyle style) {
    heading1 = style;
  }

  //Label
  TextStyle get label1 => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: ColorConstant.instance.dark0,
      );

  set label1(TextStyle style) {
    label1 = style;
  }

  TextStyle get label2 => TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: ColorConstant.instance.dark0,
      );

  set label2(TextStyle style) {
    heading1 = style;
  }

  TextStyle get label3 => TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: ColorConstant.instance.dark0,
      );

  set label3(TextStyle style) {
    heading1 = style;
  }
}
