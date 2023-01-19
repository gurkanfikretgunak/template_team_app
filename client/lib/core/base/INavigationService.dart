// ignore_for_file: file_names

abstract class INavigationService {
  Future<T?> navigateToPage<T extends Object?>(String path, {Object data});
  Future<T?> navigateToPageClear<T extends Object?>(
      {required String path, Object? data});
}
