import 'package:client/core/base/base_cache_manager/base_cache_manager.dart';

class PermissionCacheManager extends ICacheManager<bool> {
  PermissionCacheManager() {
    init();
  }

  @override
  writeItem(String key, bool value) async {
    box.write(key, value);
  }
}
