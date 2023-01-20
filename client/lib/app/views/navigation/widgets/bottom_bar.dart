import 'package:client/app/views/navigation/navigation.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Booking",
          icon: Icon(Icons.add),
        ),
        BottomNavigationBarItem(
          label: "Account",
          icon: Icon(Icons.person_outline),
        ),
      ],
      currentIndex: context.watch<BottomNavBarViewModel>().currentPage,
      onTap: context.read<BottomNavBarViewModel>().changePage,
    );
  }
}
