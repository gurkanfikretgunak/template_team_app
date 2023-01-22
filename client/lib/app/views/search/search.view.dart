import 'package:client/app/views/home/home.widgets.dart';
import 'package:client/app/views/search/search.widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class SearchView extends BaseView with SearchWidgets {
  const SearchView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      appbar: HomeWidgets().appbar(context),
      body: searchBody(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
