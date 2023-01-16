import 'package:flutter/material.dart';

class CustomOverlayWidget {
  static void settingModalBottomSheet(context, Widget widgetSheet) {
    showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => widgetSheet);
  }

  static EdgeInsetsDirectional sheetBottomValue() {
    return const EdgeInsetsDirectional.only(
      start: 20,
      end: 20,
      bottom: 30,
      top: 8,
    );
  }
}
