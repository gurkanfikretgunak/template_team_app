class UserRegisterResponse {
  bool? success;
  List<Data>? data;
  String? message;
  bool? pagination;

  UserRegisterResponse(
      {this.success, this.data, this.message, this.pagination});

  UserRegisterResponse.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? accessToken;
  String? refreshToken;

  Data({this.user, this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class User {
  String? email;
  String? name;
  String? surname;
  String? password;
  String? phoneNumber;
  int? gender;
  List<String>? favoriteShops;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.email,
      this.name,
      this.surname,
      this.password,
      this.phoneNumber,
      this.gender,
      this.favoriteShops,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    surname = json['surname'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    favoriteShops = json['favoriteShops'].cast<String>();
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['surname'] = surname;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['gender'] = gender;
    data['favoriteShops'] = favoriteShops;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
