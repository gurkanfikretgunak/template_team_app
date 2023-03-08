import 'package:client/core/services/retrofit/api/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class IRetrofitService<T> {
  final logger = Logger();

  final client = RestClient(Dio());

  Future<List<T>>? getAll();

  Future<T>? getById(String id);

  Future<T>? post(T entity);

  Future<T>? delete(T entity);

  Future<T>? patch(T entity);
}
