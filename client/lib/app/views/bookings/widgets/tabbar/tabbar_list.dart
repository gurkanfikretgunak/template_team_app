import 'package:client/app/l10n/app_l10n.dart';
import 'package:flutter/material.dart';

List<Tab> tabBarList(BuildContext context) {
  return [
    Tab(child: Text(L10n.of(context)!.past)),
    Tab(child: Text(L10n.of(context)!.upcoming)),
    Tab(child: Text(L10n.of(context)!.favorites)),
  ];
}
