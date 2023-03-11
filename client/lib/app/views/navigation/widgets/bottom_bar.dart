import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/navigation/bloc/navigation_bloc.dart';
import 'package:client/app/views/navigation/bloc/navigation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
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
      child: BlocBuilder<PageBloc, int>(builder: (context, snapshot) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: L10n.of(context)!.home,
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home)),
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
              activeIcon: const Icon(Icons.person),
            ),
          ],
          currentIndex: BlocProvider.of<PageBloc>(context).state,
          onTap: (index) {
            BlocProvider.of<PageBloc>(context).add(ChangePage(index));
          },
        );
      }),
    );
  }
}
