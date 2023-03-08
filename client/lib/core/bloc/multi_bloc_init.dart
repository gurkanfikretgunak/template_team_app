import 'package:client/app/views/auth/sign_up/sign_up_bloc/sign_up.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class MultiBlocInit {
  final List<SingleChildWidget> blocs = [
    BlocProvider<SignUpBloc>(create: (_) => SignUpBloc()),
  ];
}
