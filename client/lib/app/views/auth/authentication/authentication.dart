import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._init();
  static SecureStorage get instance => _instance;
  SecureStorage._init();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const _tokenKey = 'TOKEN';

  Future<void> persistEmailAndToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<bool> hasToken() async {
    var value = await _storage.read(key: _tokenKey);
    return value != null;
  }

  Future<void> deleteToken() async {
    return _storage.delete(key: _tokenKey);
  }

  Future<Future<String?>> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<void> deleteAll() async {
    return _storage.deleteAll();
  }
}
