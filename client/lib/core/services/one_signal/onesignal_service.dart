import 'package:client/core/constans/app_constant.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static OneSignal? _instance;
  OneSignalService() {
    getInstance();
    _instance!.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    _instance!.setAppId(AppConstant.instance.oneSignalAppId);
    /*  _instance!.promptUserForPushNotificationPermission().then((accepted) {}); */
    _instance!.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(event.notification);
    });

    _instance!.setExternalUserId("");
    _instance!.setPermissionObserver((OSPermissionStateChanges changes) {});
  }

  OneSignal? getInstance() {
    _instance ??= OneSignal.shared;
    return _instance;
  }

  void handleClickNotification() {
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      //OneSignal'dan gelen bildirime tıklandı.
    });
  }
}
