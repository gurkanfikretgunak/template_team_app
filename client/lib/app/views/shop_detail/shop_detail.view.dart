import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/app/views/shop_detail/bloc/shop_detail.bloc.dart';
import 'package:client/app/views/shop_detail/bloc/shop_detail.states.dart';
import 'package:client/app/views/shop_detail/shop_detail.viewmodel.dart';
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
          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: state.shopDetailResponse.data!.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child:
                            Text(state.shopDetailResponse.data![0].shop.name),
                      );
                    },
                  ),
                ),
              ),
              /*  ListView.builder(
                  itemCount: state.addressResponse.data.length,
                  itemBuilder: (context, index) {
                   // Datum address = state.addressResponse.data[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(address.address.addressOwner),
                        ),
                        title: Text(
                          address.address.addressOwner.toString(),
                        ),
                      ),
                    );
                  },
                ), */
            ],
          );
        }
        if (state is ShopDetailErrorState) {
          return const Text("Err");
        }
        return const Center(child: Text('No data'));
      },
    )

        // Consumer<ShopDetailViewModel>(
        //   builder: (context, value, child) {
        //     return Stack(
        //       children: [
        //         SliverShopDetailWidget(
        //           shopModel: MockShop.bookingList(context)[1],
        //         ),
        //         value.selectedShop
        //             ? CheckoutButton(
        //                 itemCount: value.itemCount,
        //                 totalPrice: value.totalPrice,
        //                 onPressed: () => NavigationService.instance
        //                     .navigateToPage(Routes.checkout.name),
        //               )
        //             : const SizedBox()
        //       ],
        //     );
        //   },
        // ),

        );
  }
}
