import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

abstract class ICacheManager<T> {
  late GetStorage box;

  Future<bool?> init() async {
    box = GetStorage();
    await GetStorage.init()
        ? Logger().e("Initialized get storage ")
        : Logger().e("No initialized get storage");
    return null;
  }

  Future<void> writeItem(String key, T value) async {
    box.write(key, value);
  }

  T? readItem(String key) {
    box.read(key);
    return null;
  }

  Future<void> eraseBox() async {
    box.erase();
  }

  T? getAllKeys() {
    box.getKeys();
    return null;
  }

  T? getValuesKeys() {
    box.getValues();
    return null;
  }

  Future<void> removeItem(String key) async {
    box.remove(key);
  }

  Future<void> saveBox(String key) async {
    box.save();
  }
}
