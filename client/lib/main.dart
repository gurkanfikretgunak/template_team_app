import 'package:client/app/app.dart';

import 'package:client/app/widgets/system_ui_overlay/system_ui_overlay.dart';
import 'package:client/app/widgets/system_ui_overlay/status_bar_color.dart';
import 'package:flutter/material.dart';

void main() {
  SystemUIOverlay().systemUIOverlay(StatusBarColor.dark);
  runApp(
    const App(),
  );
}
