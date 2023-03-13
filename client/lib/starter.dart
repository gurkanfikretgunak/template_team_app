import 'package:client/app/app.dart';
import 'package:client/app/views/account/manage_address/bloc/manage_address.bloc.dart';
import 'package:client/app/views/auth/sign_up/sign_up_bloc/sign_up.bloc.dart';
import 'package:client/app/views/navigation/bloc/navigation_bloc.dart';
import 'package:client/app/views/shop_detail/bloc/shop_detail.bloc.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/views/auth/authentication/authentication.dart';
import 'app/views/auth/authentication/bloc/auth_bloc.dart';
import 'app/views/auth/authentication/bloc/auth_events.dart';
import 'app/views/auth/sign_in/bloc/login_bloc.dart';
import 'core/services/retrofit/retrofit_service.dart';

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
    providers: [
      BlocProvider<LoginBloc>(
          create: (BuildContext context) =>
              LoginBloc(AuthenticationBloc(SecureStorage.instance))),
      BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) =>
              AuthenticationBloc(SecureStorage.instance)
                ..add(AuthAppStartedEvent())),
      BlocProvider<PageBloc>(create: (BuildContext context) => PageBloc()),
      BlocProvider<PageBloc>(create: (BuildContext context) => PageBloc()),
      BlocProvider<SignUpBloc>(create: (_) => SignUpBloc()),
      BlocProvider<ManageAddressBloc>(create: (_) => ManageAddressBloc()),
      BlocProvider<ShopDetailBloc>(create: (_) => ShopDetailBloc()),
    ],
    child: const App(),
  ));
}
