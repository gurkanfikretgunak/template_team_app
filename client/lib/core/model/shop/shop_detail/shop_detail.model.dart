class ShopDetailModel {
  bool? success;
  List<ShopDetailData>? data;
  String? message;
  bool? pagination;

  ShopDetailModel({this.success, this.data, this.message, this.pagination});

  ShopDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ShopDetailData>[];
      json['data'].forEach((v) {
        data!.add(ShopDetailData.fromJson(v));
      });
    }
    message = json['message'];
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['pagination'] = pagination;
    return data;
  }
}

class ShopDetailData {
  Shop? shop;
  List<Coupons>? coupons;
  List<Recommends>? recommends;
  List<Packages>? packages;
  bool? isFavorited;

  ShopDetailData(
      {this.shop,
      this.coupons,
      this.recommends,
      this.packages,
      this.isFavorited});

  ShopDetailData.fromJson(Map<String, dynamic> json) {
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(Coupons.fromJson(v));
      });
    }
    if (json['recommends'] != null) {
      recommends = <Recommends>[];
      json['recommends'].forEach((v) {
        recommends!.add(Recommends.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(Packages.fromJson(v));
      });
    }
    isFavorited = json['isFavorited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shop != null) {
      data['shop'] = shop!.toJson();
    }
    if (coupons != null) {
      data['coupons'] = coupons!.map((v) => v.toJson()).toList();
    }
    if (recommends != null) {
      data['recommends'] = recommends!.map((v) => v.toJson()).toList();
    }
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    data['isFavorited'] = isFavorited;
    return data;
  }
}

class Shop {
  Address? address;
  String? sId;
  String? name;
  String? genderPreference;
  String? phoneNumber;
  int? averageRating;
  int? numRates;
  List<ServiceTypes>? serviceTypes;

  Shop(
      {this.address,
      this.sId,
      this.name,
      this.genderPreference,
      this.phoneNumber,
      this.averageRating,
      this.numRates,
      this.serviceTypes});

  Shop.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    sId = json['_id'];
    name = json['name'];
    genderPreference = json['genderPreference'];
    phoneNumber = json['phoneNumber'];
    averageRating = json['averageRating'];
    numRates = json['numRates'];
    if (json['serviceTypes'] != null) {
      serviceTypes = <ServiceTypes>[];
      json['serviceTypes'].forEach((v) {
        serviceTypes!.add(ServiceTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['genderPreference'] = genderPreference;
    data['phoneNumber'] = phoneNumber;
    data['averageRating'] = averageRating;
    data['numRates'] = numRates;
    if (serviceTypes != null) {
      data['serviceTypes'] = serviceTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  List<double>? coordinates;
  String? fullAdress;
  String? city;
  String? country;

  Address({this.coordinates, this.fullAdress, this.city, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    fullAdress = json['fullAdress'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coordinates'] = coordinates;
    data['fullAdress'] = fullAdress;
    data['city'] = city;
    data['country'] = country;
    return data;
  }
}

class ServiceTypes {
  String? sId;
  String? name;

  ServiceTypes({this.sId, this.name});

  ServiceTypes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Coupons {
  String? sId;
  String? sharedBy;
  String? couponName;
  String? couponDesc;
  int? discount;
  String? expirationDate;

  Coupons(
      {this.sId,
      this.sharedBy,
      this.couponName,
      this.couponDesc,
      this.discount,
      this.expirationDate});

  Coupons.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sharedBy = json['sharedBy'];
    couponName = json['couponName'];
    couponDesc = json['couponDesc'];
    discount = json['discount'];
    expirationDate = json['expirationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sharedBy'] = sharedBy;
    data['couponName'] = couponName;
    data['couponDesc'] = couponDesc;
    data['discount'] = discount;
    data['expirationDate'] = expirationDate;
    return data;
  }
}

class Recommends {
  String? sId;
  String? provider;
  String? name;
  int? cost;
  int? duration;
  String? image;
  String? type;

  Recommends(
      {this.sId,
      this.provider,
      this.name,
      this.cost,
      this.duration,
      this.image,
      this.type});

  Recommends.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    provider = json['provider'];
    name = json['name'];
    cost = json['cost'];
    duration = json['duration'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['provider'] = provider;
    data['name'] = name;
    data['cost'] = cost;
    data['duration'] = duration;
    data['image'] = image;
    data['type'] = type;
    return data;
  }
}

class Packages {
  String? sId;
  String? provider;
  String? name;
  int? cost;
  int? duration;
  String? image;
  List<String>? services;

  Packages(
      {this.sId,
      this.provider,
      this.name,
      this.cost,
      this.duration,
      this.image,
      this.services});

  Packages.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    provider = json['provider'];
    name = json['name'];
    cost = json['cost'];
    duration = json['duration'];
    image = json['image'];
    services = json['services'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['provider'] = provider;
    data['name'] = name;
    data['cost'] = cost;
    data['duration'] = duration;
    data['image'] = image;
    data['services'] = services;
    return data;
  }
}
