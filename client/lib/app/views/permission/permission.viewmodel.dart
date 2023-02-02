import 'package:client/app/views/permission/widgets/permissions.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  PageController? pageController = PageController(initialPage: 0);

  final List<bool> _statusList = [false, false, false];
  bool get isClicked => _statusList[_currentIndex];

  sendNotification(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        Permissions.instance.requestPermission(context, Permission.location);
        _statusList[_currentIndex] = !_statusList[_currentIndex];
        break;
      case 1:
        Permissions.instance.requestPermission(context, Permission.camera);
        _statusList[_currentIndex] = !_statusList[_currentIndex];
        break;
      case 2:
        Permissions.instance
            .requestPermission(context, Permission.notification);
        _statusList[_currentIndex] = !_statusList[_currentIndex];
        break;
      default:
    }
  }
}
