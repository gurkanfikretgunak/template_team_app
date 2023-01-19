import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class SortFilter extends BaseView {
  const SortFilter({super.key});

  @override
  Widget build(BuildContext context) {
    List sortFilterOptions = [
      "Popularity",
      "Rating : High to Low",
      "Cost : High to Low",
      "Cost : Low to High",
    ];

    return dynamicBuild(
      context,
      error: HasError.off,
      body: CustomRadioButton(list: sortFilterOptions),
      errorBody: const Text("err"),
    );
  }
}
