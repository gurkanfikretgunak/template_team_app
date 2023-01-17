import 'package:client/app/views/home/home.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class HomeView extends BaseView with HomeWidgets {
  const HomeView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: appBar(),
      body: body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
