import 'package:client/core/init/cache/isar/collection/auth/auth_data_crypto.dart';
import 'package:client/core/init/cache/isar/collection/auth/auth_datas.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

class IsarLocalDatabase {
  IsarLocalDatabase._();

  static final IsarLocalDatabase _instance = IsarLocalDatabase._();

  static IsarLocalDatabase get instance => _instance;

  // Initializes the Isar database and opens a connection to it.
  // Retrieves some data from the "authDatas" collection and prints it.
  initIsar() async {
    final isar = Isar.getInstance();
    Isar.openSync([AuthDatasSchema, AutoDataCryptoSchema]);

    final autoDatas =
        isar?.authDatas.where(sort: Sort.asc).accesTokenProperty();

    Logger().i("autoDatas: $autoDatas");
  }

  // Creates two objects of type "AuthDatas" and "AutoDataCrypto".
  // Uses the Isar instance to write these objects to their respective collections.
  crateData(String accesToken, String email) async {
    final isar = Isar.getInstance();
    final nullController = AuthDatas()
      ..accesToken = accesToken
      ..id = Isar.autoIncrement
      ..email = email;

    final nullChainConroller = AutoDataCrypto()
      ..id = Isar.autoIncrement
      ..name = "test";

    await isar?.writeTxn(() async {
      await isar.autoDataCryptos.put(nullChainConroller);
      await isar.authDatas.put(
        nullController,
      );
    });
  }

  // Retrieves all records from the "authDatas" collection and prints their "access_token" values.
  getIsarRecord() async {
    final isar = Isar.getInstance();
    List<AuthDatas>? authDatas = await isar?.authDatas.where().findAll();
    return (authDatas?.map((e) => e.accesToken))!.last;
  }
}

// The purpose of this code is to demonstrate how to use the Isar database in a Flutter project.
// The IsarLocalDatabase class has three methods: initIsar, crateDate, and getIsarRecord.
// It also imports two Isar collection classes: AuthDataCrypto and AuthDatas.
// The AuthDataCryptoSchema and AuthDatasSchema classes are used to define the schema of the collections.