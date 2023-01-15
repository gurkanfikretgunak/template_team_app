import 'package:client/app/views/splash/splash.view.dart';
import 'package:client/app/widgets/inputs/widgets/check_box/custom_check_box.dart';
import 'package:client/app/widgets/status_bar/custom_status_bar.dart';
import 'package:client/app/widgets/status_bar/status_bar_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  SystemUIOverlay().systemUIOverlay(StatusBarColor.dark);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CheckboxNotifier()),
    ],
    child: const MaterialApp(
      home: SplashView(false),
    ),
  ));
}
