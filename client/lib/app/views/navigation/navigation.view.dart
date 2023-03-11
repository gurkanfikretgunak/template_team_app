import 'package:client/app/views/navigation/widgets/bottom_bar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../account/account_home/account.view.dart';
import '../bookings/bookings.view.dart';
import '../home/home.view.dart';
import '../search/search.view.dart';
import 'bloc/navigation_bloc.dart';

class NavigationView extends BaseView {
  const NavigationView(this.error, {super.key});

  final bool? error;

  HasError backendError() {
    return error! ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageOptions = <Widget>[
      const HomeView(false),
      const SearchView(false),
      const BookingsView(false),
      const AccountView(false),
    ];
    return dynamicBuild(
      context,
      error: backendError(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: BlocBuilder<PageBloc, int>(builder: (context, currentPageIndex) {
        return Center(child: pageOptions.elementAt(currentPageIndex));
      }),
      errorBody: const Text('errorrrr'),
    );
  }
}
