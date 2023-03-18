import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:equatable/equatable.dart';

class ShopDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShopDetailInitialState extends ShopDetailState {}

class ShopDetailLoadingState extends ShopDetailState {}

class ShopDetailLoadedState extends ShopDetailState {
  ShopDetailModel shopDetailResponse;
  ShopDetailLoadedState(this.shopDetailResponse);
}

class ShopDetailErrorState extends ShopDetailState {
  String e;
  ShopDetailErrorState(this.e);
}
