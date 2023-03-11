import 'package:equatable/equatable.dart';

class UserLoginRequest extends Equatable {
  String? email;
  String? password;
  UserLoginRequest({this.email, this.password});

  UserLoginRequest.fromJson(
      Map<String, dynamic> json, this.email, this.password) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  @override
  List<Object?> get props => [email, password];
  static final empty = UserLoginRequest(email: "-", password: "-");
}
