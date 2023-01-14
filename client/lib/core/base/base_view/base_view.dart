import 'package:flutter/material.dart';

enum HasError { on, off }

abstract class BaseView extends StatelessWidget {
  const BaseView({super.key});

  dynamicBuild(BuildContext context,
      {required HasError error,
      required Widget body,
      required Widget errorBody}) {
    switch (error) {
      case HasError.off:
        return baseBuild(context, body: body);
      case HasError.on:
        return errorBuild(context, body: errorBody);

      default:
    }
  }

  Widget baseBuild(BuildContext context, {required Widget body}) =>
      Scaffold(body: body);

  Widget errorBuild(BuildContext context, {required Widget body}) =>
      Scaffold(body: body);
}
