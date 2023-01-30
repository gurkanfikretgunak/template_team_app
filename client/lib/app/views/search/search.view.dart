import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/search/search.widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

import '../../../core/constans/text_constants.dart';

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
      appbar: CustomAppbar(
        leading: Text(
          L10n.of(context)!.search,
          style: TextConstants.instance.heading6,
        ),
      ),
      body: searchBody(context),
      errorBody: const Text('errorrrr'),
    );
  }
}
