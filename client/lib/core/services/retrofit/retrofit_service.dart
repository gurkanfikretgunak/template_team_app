import 'package:client/core/model/login/user_login_request.dart';
import 'package:client/core/model/login/user_login_response.dart';
import 'package:client/core/model/register/user_register_request.dart';
import 'package:client/core/model/register/user_register_response.dart';
import 'package:client/core/services/retrofit/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class RetrofitService {
  static final RetrofitService _instance = RetrofitService._init();
  static RetrofitService get instance => _instance;
  RetrofitService._init();

  final client = RestClient(Dio());

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

      GetStorage().write('accessToken', response.data![0].accessToken);
      GetStorage().write('refreshToken', response.data![0].refreshToken);

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

      GetStorage().write('accessToken', response.data![0].accessToken);
      GetStorage().write('refreshToken', response.data![0].refreshToken);

      return response;
    } catch (e) {
      return UserLoginResponse(
        success: false,
        message: e.toString(),
      );
    }
  }
}
