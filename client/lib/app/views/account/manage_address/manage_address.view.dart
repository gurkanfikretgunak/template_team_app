import 'package:client/app/views/account/manage_address/manage_address.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class ManageAddressView extends BaseView with ManageAddressWidgets {
  const ManageAddressView(this.error, {super.key});

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
      body: body(),
      errorBody: const Text('errorrrr'),
    );
  }
}
