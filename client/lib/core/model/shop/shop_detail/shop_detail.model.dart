// To parse this JSON data, do
//
//     final shopDetailModel = shopDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShopDetailModel shopDetailModelFromJson(String str) =>
    ShopDetailModel.fromJson(json.decode(str));

String shopDetailModelToJson(ShopDetailModel data) =>
    json.encode(data.toJson());

class ShopDetailModel {
  ShopDetailModel({
    this.success,
    this.data,
    this.message,
    this.pagination,
  });

  bool? success;
  List<ShopDetailData>? data;
  String? message;
  bool? pagination;

  factory ShopDetailModel.fromJson(Map<String, dynamic> json) =>
      ShopDetailModel(
        success: json["success"],
        data: List<ShopDetailData>.from(
            json["data"].map((x) => ShopDetailData.fromJson(x))),
        message: json["message"],
        pagination: json["pagination"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "pagination": pagination,
      };
}

class ShopDetailData {
  ShopDetailData({
    required this.shop,
    required this.coupons,
    required this.recommends,
    required this.packages,
    required this.isFavorited,
  });

  Shop shop;
  List<Coupon> coupons;
  List<Package> recommends;
  List<Package> packages;
  bool isFavorited;

  factory ShopDetailData.fromJson(Map<String, dynamic> json) => ShopDetailData(
        shop: Shop.fromJson(json["shop"]),
        coupons:
            List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
        recommends: List<Package>.from(
            json["recommends"].map((x) => Package.fromJson(x))),
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
        isFavorited: json["isFavorited"],
      );

  Map<String, dynamic> toJson() => {
        "shop": shop.toJson(),
        "coupons": List<dynamic>.from(coupons.map((x) => x.toJson())),
        "recommends": List<dynamic>.from(recommends.map((x) => x.toJson())),
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
        "isFavorited": isFavorited,
      };
}

class Coupon {
  Coupon({
    required this.id,
    required this.sharedBy,
    required this.couponName,
    required this.couponDesc,
    required this.discount,
    required this.expirationDate,
  });

  String id;
  String sharedBy;
  String couponName;
  String couponDesc;
  int discount;
  DateTime expirationDate;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["_id"],
        sharedBy: json["sharedBy"],
        couponName: json["couponName"],
        couponDesc: json["couponDesc"],
        discount: json["discount"],
        expirationDate: DateTime.parse(json["expirationDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sharedBy": sharedBy,
        "couponName": couponName,
        "couponDesc": couponDesc,
        "discount": discount,
        "expirationDate": expirationDate.toIso8601String(),
      };
}

class Package {
  Package({
    required this.id,
    required this.provider,
    required this.name,
    required this.cost,
    required this.duration,
    required this.image,
    required this.services,
    required this.type,
  });

  String id;
  String provider;
  String name;
  int cost;
  int duration;
  String image;
  List<String> services;
  String type;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["_id"],
        provider: json["provider"],
        name: json["name"],
        cost: json["cost"],
        duration: json["duration"],
        image: json["image"],
        services: List<String>.from(json["services"].map((x) => x)),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "provider": provider,
        "name": name,
        "cost": cost,
        "duration": duration,
        "image": image,
        "services": List<dynamic>.from(services.map((x) => x)),
        "type": type,
      };
}

class Shop {
  Shop({
    required this.address,
    required this.id,
    required this.name,
    required this.genderPreference,
    required this.phoneNumber,
    required this.averageRating,
    required this.numRates,
    required this.serviceTypes,
  });

  Address address;
  String id;
  String name;
  String genderPreference;
  String phoneNumber;
  int averageRating;
  int numRates;
  List<ServiceType> serviceTypes;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        address: Address.fromJson(json["address"]),
        id: json["_id"],
        name: json["name"],
        genderPreference: json["genderPreference"],
        phoneNumber: json["phoneNumber"],
        averageRating: json["averageRating"],
        numRates: json["numRates"],
        serviceTypes: List<ServiceType>.from(
            json["serviceTypes"].map((x) => ServiceType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "_id": id,
        "name": name,
        "genderPreference": genderPreference,
        "phoneNumber": phoneNumber,
        "averageRating": averageRating,
        "numRates": numRates,
        "serviceTypes": List<dynamic>.from(serviceTypes.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    required this.coordinates,
    required this.fullAdress,
    required this.city,
    required this.country,
  });

  List<double> coordinates;
  String fullAdress;
  String city;
  String country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
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

class ServiceType {
  ServiceType({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
