import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/about/about.widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class AboutView extends BaseView with AboutWidgets {
  const AboutView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: CustomAppbar(title: L10n.of(context)!.about),
      body: body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
