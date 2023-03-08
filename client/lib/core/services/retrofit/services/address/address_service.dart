import 'package:client/core/base/base_retrofit_service/base_retrofit_service.dart';
import 'package:client/core/model/address/address_model.dart';

class AddressService extends IRetrofitService<AddressModel> {
  @override
  Future<List<AddressModel>>? getAll() {
    client.getAddress();
    return null;
  }

  @override
  Future<AddressModel>? delete(AddressModel entity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<AddressModel>? getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<AddressModel>? patch(AddressModel entity) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<AddressModel>? post(AddressModel entity) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
