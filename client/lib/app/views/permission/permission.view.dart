import 'package:client/app/views/permission/permission.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class PermissionView extends BaseView with PermissionWidgets {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }
}
