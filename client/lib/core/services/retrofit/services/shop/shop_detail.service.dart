import 'package:client/core/base/base_retrofit_service/base_retrofit_service.dart';
import 'package:client/core/init/cache/isar/isar_local_database.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:logger/logger.dart';

class ShopDetailService extends IRetrofitService<ShopDetailModel> {
  @override
  Future<ShopDetailModel>? delete(ShopDetailModel entity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ShopDetailModel>? getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<ShopDetailModel> getById(String id) async {
    try {
      String accesToken = await IsarLocalDatabase.instance.getIsarRecord();

      ShopDetailModel response =
          await client.getShopDetailsById(id, "Bearer $accesToken");

      Logger().e(response.success);

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

  @override
  Future<ShopDetailModel>? patch(ShopDetailModel entity) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<ShopDetailModel>? post(ShopDetailModel entity) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
