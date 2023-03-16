import 'package:client/app/views/shop_detail/bloc/shop_detail.bloc.dart';
import 'package:client/app/views/shop_detail/bloc/shop_detail.states.dart';
import 'package:client/app/views/shop_detail/shop_detail.widget.dart';
import 'package:client/app/views/shop_detail/widget/sliver_shop_detail.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopDetailView extends BaseView with ShopDetailWidgets {
  const ShopDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(context,
        body: BlocBuilder<ShopDetailBloc, ShopDetailState>(
      builder: (context, state) {
        if (state is ShopDetailInitialState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
        if (state is ShopDetailLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }

        if (state is ShopDetailLoadedState) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: state.shopDetailResponse.data!.isEmpty
                          ? const Center(
                              child: Text("ListeBoş"),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.shopDetailResponse.data!.length,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: SliverShopDetailWidget(
                                    shopModel: state.shopDetailResponse,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),

              // CheckoutButton(
              //   itemCount: value.itemCount,
              //   totalPrice: value.totalPrice,
              //   onPressed: () => NavigationService.instance
              //       .navigateToPage(Routes.checkout.name),
              // )
            ],
          );
        }
        if (state is ShopDetailErrorState) {
          return Center(child: Text(state.e.toString()));
        }
        return const Center(child: Text('No data'));
      },
    ));
  }
}
