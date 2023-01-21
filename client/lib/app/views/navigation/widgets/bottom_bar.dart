import 'package:client/app/l10n/app_l10n.dart';
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
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(
          color: Colors.blueGrey,
        )),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: L10n.of(context)!.home,
            icon: const Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: L10n.of(context)!.search,
            icon: const Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: L10n.of(context)!.booking,
            icon: const Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: L10n.of(context)!.profile,
            icon: const Icon(Icons.person_outline),
          ),
        ],
        currentIndex: context.watch<BottomNavBarViewModel>().currentPage,
        onTap: context.read<BottomNavBarViewModel>().changePage,
      ),
    );
  }
}
