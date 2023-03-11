import 'package:bloc/bloc.dart';
import 'package:client/app/views/auth/authentication/authentication.dart';
import 'package:client/app/views/auth/authentication/bloc/auth_events.dart';
import 'package:client/app/views/auth/authentication/bloc/auth_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  SecureStorage secureStor = SecureStorage.instance;

  AuthenticationBloc(this.secureStor) : super(AuthenticationUninitialized()) {
    on<AuthAppStartedEvent>((event, emit) async {
      await _cleanIfFirstUseAfterUninstall();
      final bool hasToken = await secureStor.hasToken();
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUninitialized());
      }
    });

    on<AuthLoggedInEvent>((event, emit) async {
      emit(AuthenticationLoading());
      await secureStor.persistEmailAndToken(event.token);
      final bool hasToken = await secureStor.hasToken();
      if (!hasToken) {
        emit(AuthenticationUnauthenticated());
      } else {
        emit(AuthenticationAuthenticated());
      }
    });
    on<AuthLoggedOutEvent>((event, emit) async {
      emit(AuthenticationUnauthenticated());
    });
  }

  Future<void> _cleanIfFirstUseAfterUninstall() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('first_run') ?? true) {
      await secureStor.deleteAll();
      await prefs.setBool('first_run', false);
    }
  }
}
