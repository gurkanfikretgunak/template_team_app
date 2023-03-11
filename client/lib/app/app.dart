import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/app_routes.dart';
import 'package:client/app/routes/navigation_service.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/auth/authentication/bloc/auth_bloc.dart';
import 'package:client/app/views/auth/authentication/bloc/auth_states.dart';
import 'package:client/app/views/auth/sign_in/sign_in.view.dart';
import 'package:client/app/views/home/home.view.dart';
import 'package:client/app/views/onboarding/onboarding.view.dart';
import 'package:client/app/views/splash/splash.view.dart';
import 'package:client/core/init/theme/custom_theme.dart';
import 'package:client/core/provider/multi_provider_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MultiProviderInit().providers,
      child: MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return const SplashView(false);
          } else if (state is AuthenticationAuthenticated) {
            return const NavigationView(false);
          } else if (state is AuthenticationUnauthenticated) {
            return const SignInView();
          } else if (state is AuthenticationLoading) {
            return const CircularProgressIndicator();
          } else if (state is AuthenticatedOnboardingIncomplete) {
            return const SplashView(false);
          }
          return const SignInView();
        }),
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
