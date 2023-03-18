import 'package:client/app/views/account/manage_address/bloc/manage_address.events.dart';
import 'package:client/app/views/account/manage_address/bloc/manage_address.states.dart';
import 'package:client/core/network/retrofit/repository/address/address_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageAddressBloc extends Bloc<ManageAddressEvent, ManageAddressState> {
  ManageAddressBloc() : super(ManageAddressInitialState()) {
    on<FetchAddressEvent>((event, emit) async {
      emit(ManageAddressLoadingState());

      var postsResponse = await AddressRepository().getAddress();

      if (postsResponse!.success == true) {
        emit(ManageAddressLoadedState(postsResponse));
      } else {
        emit(ManageAddressErrorState(postsResponse.message ?? 'Error'));
      }
    });

    on<GoInitialEvent>((event, emit) async {
      emit(ManageAddressInitialState());
    });
  }
}
