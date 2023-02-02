import 'package:client/app/views/permission/permission.viewmodel.dart';
import 'package:client/app/views/permission/widgets/permission_page_widget.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PermissionWidgets {
  body(BuildContext context) {
    final provider = Provider.of<PermissionViewModel>(context);

    return PageView(
      controller: provider.pageController,
      onPageChanged: (int index) {
        Provider.of<PermissionViewModel>(context, listen: false).currentIndex =
            index;
      },
      children: <Widget>[
        PermissionPageWidget(imagePath: Assets.images.permission.location.path),
        PermissionPageWidget(imagePath: Assets.images.permission.camera.path),
        PermissionPageWidget(
            imagePath: Assets.images.permission.notification.path),
      ],
    );
  }
}
