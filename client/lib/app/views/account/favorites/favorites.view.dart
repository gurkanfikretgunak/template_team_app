import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/favorites/favorites.widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class FavoritesView extends BaseView with FavoritesWidgets {
  const FavoritesView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: CustomAppbar(
        title: L10n.of(context)!.yourFavorites,
      ),
      body: body(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
