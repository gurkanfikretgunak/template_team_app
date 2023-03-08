import 'package:equatable/equatable.dart';

abstract class SignUpBlocEvent extends Equatable {
  const SignUpBlocEvent();
}

class RegisterEvent extends SignUpBlocEvent {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}
