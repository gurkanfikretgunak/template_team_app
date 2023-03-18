import 'package:client/core/model/address/address_response.dart';
import 'package:client/core/model/login/user_login_request.dart';
import 'package:client/core/model/login/user_login_response.dart';
import 'package:client/core/model/register/user_register_request.dart';
import 'package:client/core/model/register/user_register_response.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://172.24.48.1:3000/api/v1")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/auth/register")
  Future<UserRegisterResponse> register(@Body() UserRegisterRequest user);

  @POST("/auth/login")
  Future<UserLoginResponse> login(@Body() UserLoginRequest user);

  @GET("/user/address")
  Future<AddressResponse> getAddress(
    @Header('Authorization') String token,
  );

  @GET("/shop/details/{id}")
  Future<ShopDetailModel> getShopDetailsById(
      @Path("id") String id, @Header('Authorization') String token);
}
