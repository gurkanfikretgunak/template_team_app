import 'package:permission_handler/permission_handler.dart';

class Permissions {
  static final Permissions _instance = Permissions._init();
  static Permissions get instance => _instance;
  Permissions._init();

  void requestMultiplePermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.notification,
      Permission.camera,
    ].request();
  }

  void requestLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isGranted) {
    } else if (status.isDenied) {
      if (await Permission.location.request().isGranted) {}
    }
  }

  void requestCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
    } else if (status.isDenied) {
      if (await Permission.camera.request().isGranted) {}
    }
  }

  void requestNotificationPermission() async {
    var status = await Permission.notification.status;

    if (status.isGranted) {
    } else if (status.isDenied) {
      if (await Permission.notification.request().isGranted) {}
    }
  }
}
