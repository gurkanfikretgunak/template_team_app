import 'package:client/core/base/base_cache_manager/base_cache_manager.dart';

class TokenCacheManager extends ICacheManager<String> {
  TokenCacheManager() {
    init();
  }

  @override
  writeItem(String a, String value) async {
    box.write(a, value);
  }
}
