import 'package:client/app/app.dart';

import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/multi_bloc_init.dart';

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
  runApp(MultiBlocProvider(
    providers: MultiBlocInit().blocs,
    child: const App(),
  ));
}
