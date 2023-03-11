import 'package:bloc/bloc.dart';
import 'package:client/app/views/navigation/bloc/navigation_event.dart';

class PageBloc extends Bloc<PageEvent, int> {
  PageBloc() : super(0) {
    on<ChangePage>((event, emit) async {
      emit(event.index);
    });
    on<ResetPage>((event, emit) async {
      emit(0);
    });
  }
}
