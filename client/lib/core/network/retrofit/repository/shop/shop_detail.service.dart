import 'package:client/core/init/cache/isar/isar_local_database.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:client/core/network/retrofit/api/rest_client.dart';
import 'package:dio/dio.dart';

class ShopDetailRepository {
  static final ShopDetailRepository _instance =
      ShopDetailRepository._internal();

  factory ShopDetailRepository() {
    return _instance;
  }

  ShopDetailRepository._internal();

  Future<ShopDetailModel> getShopDetail(String id) async {
    final Dio dio = Dio();
    final client = RestClient(dio);
    try {
      String accesToken = await IsarLocalDatabase.instance.getIsarRecord();

      ShopDetailModel response =
          await client.getShopDetailsById(id, "Bearer $accesToken");

      return response;
    } catch (e) {
      return ShopDetailModel(
        success: false,
        message: e.toString(),
        data: [],
        pagination: true,
      );
    }
  }

  String hasServerFailureMsg() {
    Future.delayed(const Duration(seconds: 1));
    return 'No server connect code';
  }
}
