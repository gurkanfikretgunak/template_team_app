import 'package:client/app/views/auth/required_mobile/required_mobile.widget.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class RequireMobileView extends BaseView with ReguireMobileWidgets {
  const RequireMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      body: requireMobileTextField(context),
    );
  }
}
