import 'package:client/app/views/bookings/widgets/tabbar_view/tabbar_view_type.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/init/routes/navigation_service.dart';
import 'package:client/core/init/routes/routes.dart';
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
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          separatorBuilder: (context, index) {
            return Padding(
              padding: context.verticalPaddingNormal,
              child: const CustomDivider(type: DividerType.dashed),
            );
          },
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                NavigationService.instance
                    .navigateToPage(Routes.bookingDetail.name);
              },
              child: TabBarViewTypeLabel().buildOrderCard(tabBarViewType),
            );
          },
        ),
      ),
      errorBody: const Text("df"),
    );
  }
}
