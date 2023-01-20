import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/tabbar/custom_tabbar.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/cupertino.dart';

import 'widgets/tabbar_widgets.dart';

class BookingsWidgets {
  appBar() {
    return CustomAppbar(
        leading: Text(
      "Your Bookings",
      style: TextConstants.instance.heading6,
    ));
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(
          tabBarList: tabBarList,
          tabBarViewList: tabBarViewList,
        ),
      ],
    );
  }
}
