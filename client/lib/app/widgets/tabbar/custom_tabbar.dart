import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabBarList,
    required this.tabBarViewList,
  });

  final List<Widget> tabBarList;
  final List<Widget> tabBarViewList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        initialIndex: 0,
        length: tabBarList.length,
        child: Column(
          children: [
            Expanded(
              child: TabBar(
                // indicatorColor: ColorConstant.instance.purple2,
                // labelColor: ColorConstant.instance.purple2,
                // unselectedLabelColor: ColorConstant.instance.dark3,
                indicatorWeight: 3,
                tabs: tabBarList,
              ),
            ),
            Expanded(
              flex: 9,
              child: TabBarView(
                children: tabBarViewList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
