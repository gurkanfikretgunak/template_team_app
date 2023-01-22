import 'package:client/app/views/splash/splash.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class SplashView extends BaseView with SplashWidgets {
  const SplashView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      body: body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
