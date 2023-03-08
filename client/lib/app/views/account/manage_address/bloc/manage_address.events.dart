import 'package:equatable/equatable.dart';

abstract class ManageAddressEvent extends Equatable {
  const ManageAddressEvent();
}

class FetchAddressEvent extends ManageAddressEvent {
  const FetchAddressEvent();

  @override
  List<Object?> get props => [];
}

class GoInitialEvent extends ManageAddressEvent {
  const GoInitialEvent();

  @override
  List<Object?> get props => [];
}
