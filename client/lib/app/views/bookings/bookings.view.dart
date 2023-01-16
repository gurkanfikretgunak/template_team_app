import 'package:client/app/views/bookings/bookings.widgets.dart';
import 'package:client/app/views/bookings/widgets/tabbar/tabbar_list.dart';
import 'package:client/app/views/bookings/widgets/tabbar_view/tabbar_view_list.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/tabbar/custom_tabbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/text_constants.dart';
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
      appbar: CustomAppbar(
          leading: Text(
        "Your Bookings",
        style: TextConstants.instance.heading6,
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTabBar(
            tabBarList: tabBarList,
            tabBarViewList: tabBarViewList,
          ),
        ],
      ),
      errorBody: const Text('errorrrr'),
    );
  }
}
