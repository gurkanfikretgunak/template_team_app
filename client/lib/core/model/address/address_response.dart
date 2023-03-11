class AddressResponse {
  bool? success;
  List<Data>? data;
  String? message;
  bool? pagination;

  AddressResponse({this.success, this.data, this.message, this.pagination});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  List<Addresses>? addresses;

  Data({this.addresses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  Address? address;
  String? sId;
  String? addressOwner;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Addresses(
      {this.address,
      this.sId,
      this.addressOwner,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Addresses.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    sId = json['_id'];
    addressOwner = json['addressOwner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['_id'] = sId;
    data['addressOwner'] = addressOwner;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
