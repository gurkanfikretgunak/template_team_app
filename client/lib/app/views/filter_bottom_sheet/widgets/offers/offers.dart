import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class OffersFilter extends BaseView {
  const OffersFilter({super.key});

  @override
  Widget build(BuildContext context) {
    List sortFilterOptions = [
      L10n.of(context)!.popularity,
      L10n.of(context)!.ratingHighToLow,
      L10n.of(context)!.costHighToLow,
      L10n.of(context)!.costLowToHigh,
    ];

    return dynamicBuild(
      context,
      error: HasError.off,
      body: CustomRadioButton(list: sortFilterOptions),
      errorBody: const Text("err"),
    );
  }
}
