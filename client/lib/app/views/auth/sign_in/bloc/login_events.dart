import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonEvent extends LoginEvent {
  const LoginButtonEvent();
  @override
  List<Object> get props => [];
}
