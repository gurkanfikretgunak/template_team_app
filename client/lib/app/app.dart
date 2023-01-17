import 'package:client/core/provider/multi_provider_init.dart';
import 'package:client/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'widgets/bottom_bar/bottom_bar.view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MultiProviderInit().providers,
      child: MaterialApp(
        home: const BottomBarView(false),
        title: "Survey App",
        theme: CustomTheme.customLightTheme(context),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
