import 'package:client/core/model/register/user_register_response.dart';
import 'package:equatable/equatable.dart';

class SignUpBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpBlocInitialState extends SignUpBlocState {}

class SignUpBlocLoadingState extends SignUpBlocState {}

class SignUpBlocLoadedState extends SignUpBlocState {
  UserRegisterResponse registerResponse;
  SignUpBlocLoadedState(this.registerResponse);
}

class SignUpBlocErrorState extends SignUpBlocState {
  String e;
  SignUpBlocErrorState(this.e);
}
