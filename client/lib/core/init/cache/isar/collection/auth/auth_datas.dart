import 'package:isar/isar.dart';

part 'auth_datas.g.dart';

@collection
class AuthDatas {
  Id? id;

  String? accesToken;

  String? email;

  @ignore
  String? password;
}
