import 'package:client/app/views/beauty_service_detail/beauty_service_detail.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class BeautyServiceDetailView extends BaseView with BeautyServiceDetailWidgets {
  const BeautyServiceDetailView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: appbar(context),
      body: body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
