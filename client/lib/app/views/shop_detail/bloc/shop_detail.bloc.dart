import 'package:client/app/views/shop_detail/bloc/shop_detail.events.dart';
import 'package:client/app/views/shop_detail/bloc/shop_detail.states.dart';
import 'package:client/core/services/retrofit/services/shop/shop_detail.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class ShopDetailBloc extends Bloc<ShopDetailEvent, ShopDetailState> {
  ShopDetailBloc() : super(ShopDetailInitialState()) {
    on<FetchShopDetailEvent>((event, emit) async {
      emit(ShopDetailLoadingState());

      var shopDetailResponse =
          await ShopDetailService().getById("6408dba901944083922f1c47");

      Logger().e(shopDetailResponse);
      if (shopDetailResponse!.success == true) {
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
