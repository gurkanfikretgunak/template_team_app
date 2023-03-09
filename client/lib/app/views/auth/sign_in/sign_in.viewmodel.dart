import 'package:client/core/init/cache/permission_cache_manager/permission_cache_manager.dart';
import 'package:client/core/init/cache/token_cache_manager/token_cache_manager.dart';
import 'package:client/core/model/login/user_login_response.dart';
import 'package:client/core/services/retrofit/retrofit_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class SignInViewModel extends ChangeNotifier {
  PermissionCacheManager permissionCacheManager = PermissionCacheManager();
  final TokenCacheManager tokenCacheManager = TokenCacheManager();

  TextEditingController passwordText = TextEditingController();
  TextEditingController emailText = TextEditingController();

  PageController? pageController;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }



  permissionSetCache(bool condition) async {
    await permissionCacheManager.writeItem('permission', condition);
  }

  permissionGetCache() async {
    bool boolValue = permissionCacheManager.readItem('permission') ?? false;
    return boolValue;
  }
}
