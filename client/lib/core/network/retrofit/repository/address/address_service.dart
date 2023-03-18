import 'package:client/core/init/cache/isar/isar_local_database.dart';
import 'package:client/core/model/address/address_response.dart';
import 'package:client/core/network/retrofit/api/rest_client.dart';
import 'package:dio/dio.dart';

class AddressRepository {
  Future<AddressResponse>? getAddress() async {
    final Dio dio = Dio();
    final client = RestClient(dio);
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
}
