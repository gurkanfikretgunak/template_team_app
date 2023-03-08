// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    required this.success,
    required this.data,
    required this.message,
    required this.pagination,
  });

  bool success;
  List<Datum> data;
  String message;
  bool pagination;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        pagination: json["pagination"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "pagination": pagination,
      };
}

class Datum {
  Datum({
    required this.address,
  });

  DatumAddress address;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        address: DatumAddress.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
      };
}

class DatumAddress {
  DatumAddress({
    required this.addressOwner,
    required this.address,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String addressOwner;
  AddressAddress address;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory DatumAddress.fromJson(Map<String, dynamic> json) => DatumAddress(
        addressOwner: json["addressOwner"],
        address: AddressAddress.fromJson(json["address"]),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "addressOwner": addressOwner,
        "address": address.toJson(),
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class AddressAddress {
  AddressAddress({
    required this.coordinates,
    required this.fullAdress,
    required this.city,
    required this.country,
  });

  List<double> coordinates;
  String fullAdress;
  String city;
  String country;

  factory AddressAddress.fromJson(Map<String, dynamic> json) => AddressAddress(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        fullAdress: json["fullAdress"],
        city: json["city"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "fullAdress": fullAdress,
        "city": city,
        "country": country,
      };
}
