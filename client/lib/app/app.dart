import 'package:client/app/views/auth/required_mobile/rquired_mobile.view.dart';
import 'package:client/app/views/auth/sign_in/sign_in.view.dart';
import 'package:client/app/views/auth/sign_up/sign_up.view.dart';
import 'package:client/app/views/auth/verify_mobile/otp_input.view.dart';
import 'package:client/app/views/auth/verify_mobile/widget/otp_input.dart';
import 'package:client/core/provider/multi_provider_init.dart';
import 'package:client/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MultiProviderInit().providers,
      child: MaterialApp(
        home: const OtpInputView(),
        title: "Survey App",
        theme: CustomTheme.customLightTheme(context),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
