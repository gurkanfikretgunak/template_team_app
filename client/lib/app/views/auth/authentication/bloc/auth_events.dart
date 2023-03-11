import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent([List props = const []]) : super();
  @override
  List<Object?> get props => [];
}

class AuthAppStartedEvent extends AuthenticationEvent {}

class AuthLoggedInEvent extends AuthenticationEvent {
  final String token;
  AuthLoggedInEvent({required this.token}) : super([token]);
  @override
  List<Object?> get props => [token];
}

class AuthLoggedOutEvent extends AuthenticationEvent {}
