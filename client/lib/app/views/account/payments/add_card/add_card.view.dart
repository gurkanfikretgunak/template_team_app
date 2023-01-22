import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/payments/add_card/add_card.widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class AddCardView extends BaseView with AddCardWidgets {
  const AddCardView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: CustomAppbar(title: L10n.of(context)!.addCard),
      body: body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
