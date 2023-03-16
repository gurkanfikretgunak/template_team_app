import 'package:client/app/views/auth/sign_up/sign_up_bloc/sign_up.states.dart';
import 'package:client/app/views/auth/sign_up/sign_up_bloc/sing_up.events.dart';
import 'package:client/core/init/cache/permission_cache_manager/permission_cache_manager.dart';
import 'package:client/core/network/retrofit/retrofit_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpBlocEvent, SignUpBlocState> {
  TextEditingController nameText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  final PermissionCacheManager _permissionCacheManager =
      PermissionCacheManager();
  permissionSetCache(bool condition) {
    _permissionCacheManager.writeItem('permission', condition);
  }

  permissionGetCache() {
    bool boolValue = _permissionCacheManager.readItem('permission') ?? false;
    return boolValue;
  }

  SignUpBloc() : super(SignUpBlocInitialState()) {
    const String phoneNumber = '5326748019';

    on<RegisterEvent>((event, emit) async {
      emit(SignUpBlocLoadingState());
      List<String>? fullNameList = _fullNameSplitter(nameText.text);
      var registerResponse = await RetrofitService.instance.register(
        fullNameList![0], //name
        fullNameList[1], //surname
        emailText.text,
        passwordText.text,
        phoneNumber,
      );

      if (registerResponse.success ?? false) {
        emit(SignUpBlocLoadedState(registerResponse));
      } else {
        emit(SignUpBlocErrorState(registerResponse.message ?? 'Error'));
      }
    });
  }
}

/// Returns [String name, String surname] or null
List<String>? _fullNameSplitter(String fullName) {
  final whitespaceRE = RegExp(r"\s+");
  List<String> nameTextControl =
      fullName.replaceAll(whitespaceRE, " ").trim().split(' ');

  int count = nameTextControl.length - 1;
  String name = nameTextControl.reduce((f, s) {
    if (s != nameTextControl[count]) return '$f $s';
    return f;
  });

  String surname = nameTextControl[count];
  return [name, surname];
}
