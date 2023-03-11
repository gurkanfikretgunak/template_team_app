import 'package:client/core/model/address/address_response.dart';
import 'package:equatable/equatable.dart';

class ManageAddressState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ManageAddressInitialState extends ManageAddressState {}

class ManageAddressLoadingState extends ManageAddressState {}

class ManageAddressLoadedState extends ManageAddressState {
  AddressResponse addressResponse;
  ManageAddressLoadedState(this.addressResponse);
}

class ManageAddressErrorState extends ManageAddressState {
  String e;
  ManageAddressErrorState(this.e);
}
