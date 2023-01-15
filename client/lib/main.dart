import 'package:client/app/views/splash/splash.view.dart';
import 'package:client/app/widgets/inputs/check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CheckboxNotifier()),
    ],
    child: const MaterialApp(
      home: SplashView(false),
    ),
  ));
}
