import 'package:client/core/base/base_retrofit_service/base_retrofit_service.dart';
import 'package:client/core/init/cache/isar/isar_local_database.dart';
import 'package:client/core/model/address/address_response.dart';

class AddressService extends IRetrofitService<AddressResponse> {
  @override
  Future<AddressResponse>? getAll() async {
    try {
      String accesToken = await IsarLocalDatabase.instance.getIsarRecord();

      AddressResponse response = await client.getAddress("Bearer $accesToken");

      return response;
    } catch (e) {
      return AddressResponse(
        success: false,
        message: e.toString(),
      );
    }
  }

  @override
  Future<AddressResponse>? delete(AddressResponse entity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<AddressResponse>? getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<AddressResponse>? patch(AddressResponse entity) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<AddressResponse>? post(AddressResponse entity) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
