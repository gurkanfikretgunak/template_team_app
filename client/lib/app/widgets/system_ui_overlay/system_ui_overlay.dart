import 'package:client/app/widgets/system_ui_overlay/status_bar_color.dart';
import 'package:flutter/services.dart';

class SystemUIOverlay {
  systemUIOverlay(StatusBarColor statusBarColorColor) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColorColor == StatusBarColor.dark
            ? StatusBarColorLabel.dark()
            : StatusBarColorLabel.light(),
      ),
    );
  }
}
