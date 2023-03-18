import 'package:client/app/views/shop_detail/bloc/shop_detail.events.dart';
import 'package:client/app/views/shop_detail/bloc/shop_detail.states.dart';
import 'package:client/core/network/retrofit/repository/shop/shop_detail.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopDetailBloc extends Bloc<ShopDetailEvent, ShopDetailState> {
  ShopDetailBloc() : super(ShopDetailInitialState()) {
    on<FetchShopDetailEvent>((event, emit) async {
      emit(ShopDetailLoadingState());

      var shopDetailResponse = await ShopDetailRepository()
          .getShopDetail("6408dba901944083922f1c47");
      if (shopDetailResponse.success == true) {
        emit(ShopDetailLoadedState(shopDetailResponse));
      } else {
        emit(ShopDetailErrorState(shopDetailResponse.message ?? 'Error'));
      }
    });

    on<GoInitialEvent>((event, emit) async {
      emit(ShopDetailInitialState());
    });
  }
}
