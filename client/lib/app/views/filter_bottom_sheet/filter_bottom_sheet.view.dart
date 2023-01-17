import 'package:client/app/views/filter_bottom_sheet/filter_bottom_sheet.widgets.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends BaseView with FilterBottomSheetWidgets {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: HasError.off,
      body: Center(
        child: Column(
          children: <Widget>[
            appBar(context),
            const CustomDivider(),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: filterTitle(context)),
                  Expanded(flex: 3, child: buildCategoryBodyWidget(context)),
                ],
              ),
            )
          ],
        ),
      ),
      errorBody: const Text("e"),
    );
  }
}
