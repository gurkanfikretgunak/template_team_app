import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/app_routes.dart';
import 'package:client/app/routes/navigation_service.dart';
import 'package:client/app/views/auth/sign_up/sign_up.view.dart';
import 'package:client/app/views/splash/splash.view.dart';
import 'package:client/core/init/theme/custom_theme.dart';
import 'package:client/core/provider/multi_provider_init.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MultiProviderInit().providers,
      child: MaterialApp(
        home: const SignUpView(),
        title: "Salony",
        theme: CustomTheme.customLightTheme(context),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.instance.onGenerateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}
