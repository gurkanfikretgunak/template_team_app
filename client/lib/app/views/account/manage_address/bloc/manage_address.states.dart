import 'package:client/core/model/address/address_model.dart';
import 'package:equatable/equatable.dart';

class ManageAddressState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ManageAddressInitialState extends ManageAddressState {}

class ManageAddressLoadingState extends ManageAddressState {}

class ManageAddressLoadedState extends ManageAddressState {
  List<AddressModel>? addressResponse;
  ManageAddressLoadedState(this.addressResponse);
}

class ManageAddressErrorState extends ManageAddressState {
  String e;
  ManageAddressErrorState(this.e);
}
