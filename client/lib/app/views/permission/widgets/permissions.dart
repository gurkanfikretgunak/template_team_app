import 'package:client/app/routes/navigation_service.dart';
import 'package:client/app/routes/routes.dart';
import 'package:client/app/views/permission/permission.viewmodel.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class Permissions {
  static final Permissions _instance = Permissions._init();
  static Permissions get instance => _instance;
  Permissions._init();

  void requestPermission(BuildContext context, Permission permission) async {
    final provider = Provider.of<PermissionViewModel>(context, listen: false);
    var status = await permission.status;

    if (status.isGranted) {
      if (permission == Permission.notification) {
        NavigationService.instance
            .navigateToPageClear(path: Routes.navigation.name);
      } else {
        requestPermissionWithOpenSettings();
      }
    } else if (status.isDenied) {
      await permission.request().then((value) {
        if (permission != Permission.notification) {
          provider.pageController!.nextPage(
            duration: context.durationLow,
            curve: Curves.easeInOut,
          );
          provider.currentIndex = provider.currentIndex + 1;
        } else {
          NavigationService.instance
              .navigateToPageClear(path: Routes.mapsView.name);
        }
      });
    } else {
      requestPermissionWithOpenSettings();
    }
  }

  void requestPermissionWithOpenSettings() async {
    openAppSettings();
  }
}
