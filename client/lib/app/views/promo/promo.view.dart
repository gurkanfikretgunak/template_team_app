import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

import 'promo.widgets.dart';

class PromoView extends BaseView with PromoWidgets {
  const PromoView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: appBar(context),
      body: body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
