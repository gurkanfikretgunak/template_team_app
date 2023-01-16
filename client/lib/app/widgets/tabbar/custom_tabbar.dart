import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabBarList,
    required this.tabBarViewList,
  });

  final List<Tab> tabBarList;
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
                indicatorWeight: 3,
                tabs: tabBarList,
              ),
            ),
            Expanded(
              flex: 12,
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
