import 'package:client/app/views/account/manage_address/bloc/manage_address.bloc.dart';
import 'package:client/app/views/auth/sign_in/bloc/login_bloc.dart';
import 'package:client/app/views/auth/sign_up/sign_up_bloc/sign_up.bloc.dart';
import 'package:client/app/views/shop_detail/bloc/shop_detail.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../app/views/auth/authentication/authentication.dart';
import '../../app/views/auth/authentication/bloc/auth_bloc.dart';
import '../../app/views/auth/authentication/bloc/auth_events.dart';
import '../../app/views/navigation/bloc/navigation_bloc.dart';

class MultiBlocInit {
  final List<SingleChildWidget> blocs = [
    BlocProvider<SignUpBloc>(create: (_) => SignUpBloc()),
    BlocProvider<ManageAddressBloc>(create: (_) => ManageAddressBloc()),
    BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(AuthenticationBloc(SecureStorage.instance))),
    BlocProvider<AuthenticationBloc>(
        create: (_) => AuthenticationBloc(SecureStorage.instance)
          ..add(AuthAppStartedEvent())),
    BlocProvider<PageBloc>(create: (_) => PageBloc()),
    BlocProvider<ShopDetailBloc>(create: (_) => ShopDetailBloc()),
  ];
}
