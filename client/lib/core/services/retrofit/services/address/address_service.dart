import 'package:client/core/base/base_retrofit_service/base_retrofit_service.dart';
import 'package:client/core/model/address/address_model.dart';

class AddressService extends IRetrofitService<AddressModel> {
  @override
  Future<AddressModel>? getAll() {
    return client.getAddress(
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDAzNjJmY2YwZGQ2NGE1MzdiZTJmNmYiLCJpYXQiOjE2Nzg0NzUxODYsImV4cCI6MTY3ODQ4NzE4Nn0.J1l84iI5ClXBHab5hBSY0iOsSEvmo56OculYHnSHgOg");
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
