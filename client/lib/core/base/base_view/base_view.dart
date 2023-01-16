import 'package:flutter/material.dart';

enum HasError { on, off }

abstract class BaseView extends StatelessWidget {
  const BaseView({super.key});

  dynamicBuild(
    BuildContext context, {
    required HasError error,
    required Widget body,
    Widget? bottomNavigationBar,
    required Widget errorBody,
  }) {
    switch (error) {
      case HasError.off:
        return baseBuild(
          context,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        );
      case HasError.on:
        return errorBuild(context, body: errorBody);

      default:
    }
  }

  Widget baseBuild(
    BuildContext context, {
    required Widget body,
    Widget? bottomNavigationBar,
  }) =>
      SafeArea(
        child: Scaffold(
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        ),
      );

  Widget errorBuild(BuildContext context, {required Widget body}) =>
      SafeArea(child: Scaffold(body: body));
}
