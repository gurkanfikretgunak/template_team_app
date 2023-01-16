import 'package:client/app/views/bookings/widgets/tabbar_view/tabbar_view.dart';
import 'package:client/app/views/bookings/widgets/tabbar_view/tabbar_view_type.dart';
import 'package:flutter/material.dart';

List<Widget> tabBarViewList = [
  const BookingsTabBarView(tabBarViewType: TabBarViewType.past),
  const BookingsTabBarView(tabBarViewType: TabBarViewType.unComing),
  const BookingsTabBarView(tabBarViewType: TabBarViewType.favorites),
];
