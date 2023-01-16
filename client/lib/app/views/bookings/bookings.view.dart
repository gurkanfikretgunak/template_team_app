import 'package:client/app/views/bookings/bookings.widgets.dart';
import 'package:client/app/views/bookings/widgets/tabbar_list.dart';
import 'package:client/app/views/bookings/widgets/tabbar_view_list.dart';
import 'package:client/app/widgets/custom_text.dart';
import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/divider/widgets/dashed_divider.dart';
import 'package:client/app/widgets/tabbar/custom_tabbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class BookingsView extends BaseView with BookingsWidgets {
  const BookingsView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // CustomTabBar(
          //   tabBarList: tabBarList,
          //   tabBarViewList: tabBarViewList,

          // ),
          CustomText("fdsf"),
          CustomDivider(type: DividerType.dashed),

          Text("dfkkjdsfl"),
        ],
      ),
      errorBody: const Text('errorrrr'),
    );
  }
}
