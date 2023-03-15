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
        data!.add(new ShopDetailData.fromJson(v));
      });
    }
    message = json['message'];
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['pagination'] = this.pagination;
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
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(new Coupons.fromJson(v));
      });
    }
    if (json['recommends'] != null) {
      recommends = <Recommends>[];
      json['recommends'].forEach((v) {
        recommends!.add(new Recommends.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
    isFavorited = json['isFavorited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    if (this.coupons != null) {
      data['coupons'] = this.coupons!.map((v) => v.toJson()).toList();
    }
    if (this.recommends != null) {
      data['recommends'] = this.recommends!.map((v) => v.toJson()).toList();
    }
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    data['isFavorited'] = this.isFavorited;
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
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    sId = json['_id'];
    name = json['name'];
    genderPreference = json['genderPreference'];
    phoneNumber = json['phoneNumber'];
    averageRating = json['averageRating'];
    numRates = json['numRates'];
    if (json['serviceTypes'] != null) {
      serviceTypes = <ServiceTypes>[];
      json['serviceTypes'].forEach((v) {
        serviceTypes!.add(new ServiceTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['genderPreference'] = this.genderPreference;
    data['phoneNumber'] = this.phoneNumber;
    data['averageRating'] = this.averageRating;
    data['numRates'] = this.numRates;
    if (this.serviceTypes != null) {
      data['serviceTypes'] = this.serviceTypes!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['fullAdress'] = this.fullAdress;
    data['city'] = this.city;
    data['country'] = this.country;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sharedBy'] = this.sharedBy;
    data['couponName'] = this.couponName;
    data['couponDesc'] = this.couponDesc;
    data['discount'] = this.discount;
    data['expirationDate'] = this.expirationDate;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['provider'] = this.provider;
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['duration'] = this.duration;
    data['image'] = this.image;
    data['type'] = this.type;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['provider'] = this.provider;
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['duration'] = this.duration;
    data['image'] = this.image;
    data['services'] = this.services;
    return data;
  }
}
