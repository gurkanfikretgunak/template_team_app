class UserRegisterRequest {
  String? name;
  String? surname;
  String? email;
  String? password;
  String? phoneNumber;

  UserRegisterRequest(
      {this.name, this.surname, this.email, this.password, this.phoneNumber});

  UserRegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['email'] = email;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
