import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/bookings/widgets/tabbar_view/tabbar_view_type.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class BookingsTabBarView extends BaseView {
  const BookingsTabBarView({
    super.key,
    required this.tabBarViewType,
  });
  final TabBarViewType tabBarViewType;

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: HasError.off,
      body: Padding(
        padding: context.paddingNormal,
        child: InkWell(
          onTap: () {
            NavigationService.instance.navigateToPage(Routes.bookingDetail.name);
          },
          child: TabBarViewTypeLabel().buildOrderCard(tabBarViewType),
        ),
      ),
      errorBody: const Text("df"),
    );
  }
}
