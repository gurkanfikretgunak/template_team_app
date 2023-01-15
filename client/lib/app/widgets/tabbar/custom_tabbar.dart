import 'package:client/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabBarOne,
    required this.tabBarTwo,
    this.tabBarThree,
    required this.tabBarViewOne,
    required this.tabBarViewTwo,
    this.tabBarViewThree,
    required this.tabBarLength,
  });

  final Widget tabBarOne;
  final Widget tabBarTwo;
  final Widget? tabBarThree;

  final Widget tabBarViewOne;
  final Widget tabBarViewTwo;
  final Widget? tabBarViewThree;

  final TabBarLength tabBarLength;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DefaultTabController(
        initialIndex: 0,
        length: tabBarLength == TabBarLength.two
            ? TabBarLengthLabel.two()
            : TabBarLengthLabel.three(),
        child: Column(
          children: [
            Expanded(
              child: TabBar(
                indicatorWeight: 3,
                tabs: [
                  tabBarOne,
                  tabBarTwo,
                  tabBarThree!,
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: TabBarView(
                children: [
                  tabBarViewOne,
                  tabBarViewTwo,
                  tabBarViewThree!,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum TabBarLength {
  two,
  three,
}

class TabBarLengthLabel {
  TabBarLengthLabel();

  static int two() => 2;
  static int three() => 3;
}
