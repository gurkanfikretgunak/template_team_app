import 'package:equatable/equatable.dart';

abstract class ShopDetailEvent extends Equatable {
  const ShopDetailEvent();
}

class FetchShopDetailEvent extends ShopDetailEvent {
  const FetchShopDetailEvent();

  @override
  List<Object?> get props => [];
}

class GoInitialEvent extends ShopDetailEvent {
  const GoInitialEvent();

  @override
  List<Object?> get props => [];
}
