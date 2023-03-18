import 'package:client/core/init/cache/isar/isar_local_database.dart';
import 'package:client/core/init/cache/token_cache_manager/token_cache_manager.dart';
import 'package:client/core/model/login/user_login_request.dart';
import 'package:client/core/model/login/user_login_response.dart';
import 'package:client/core/model/register/user_register_request.dart';
import 'package:client/core/model/register/user_register_response.dart';
import 'package:client/core/network/retrofit/api/rest_client.dart';
import 'package:dio/dio.dart';

class RetrofitService {
  static final RetrofitService _instance = RetrofitService._init();
  static RetrofitService get instance => _instance;
  RetrofitService._init();

  final client = RestClient(Dio());

  final TokenCacheManager tokenCacheManager = TokenCacheManager();

  Future<UserRegisterResponse> register(
    String name,
    String surname,
    String email,
    String password,
    String phoneNumber,
  ) async {
    try {
      UserRegisterResponse response = await client.register(UserRegisterRequest(
          email: email,
          password: password,
          surname: surname,
          name: name,
          phoneNumber: phoneNumber));

      IsarLocalDatabase.instance.crateData(
          response.data![0].accessToken!, response.data![0].user!.email!);

      return response;
    } catch (e) {
      return UserRegisterResponse(
        success: false,
        message: e.toString(),
      );
    }
  }

  Future<UserLoginResponse> login(String email, String password) async {
    try {
      UserLoginResponse response = await client
          .login(UserLoginRequest(email: email, password: password));

      IsarLocalDatabase.instance
          .crateData(response.data![0].accessToken!, email);

      return response;
    } catch (e) {
      return UserLoginResponse(
        success: false,
        message: e.toString(),
      );
    }
  }
}
