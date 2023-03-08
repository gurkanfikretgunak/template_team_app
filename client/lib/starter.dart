import 'package:client/app/app.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

const String logLevelKey = 'log_level';

Future<void> setupApp() async {
  final logLevel = Flavor.I.getInt(logLevelKey);
  if (kDebugMode) {
    if (kDebugMode) {
      print('LogLevel set for this flavor: $logLevel');
    }
  }
  if (Flavor.I.isDevelopment) {}
  // await GetStorage.init();
  runApp(const App());
}
