import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/filter_bottom_sheet/filter_bottom_sheet.widgets.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/extensions/common_extension.dart';
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
              flex: 3,
              child: Row(
                children: [
                  Expanded(child: filterTitle(context)),
                  Expanded(flex: 3, child: buildCategoryBodyWidget(context)),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: context.paddingNormal,
                  child: SizedBox(
                    width: context.dynamicWidth(1),
                    child: CustomElevatedButton(
                      onPressed: () {},
                      text: L10n.of(context)!.apply,
                      textColor: ButtonColor.light,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      errorBody: const Text("e"),
    );
  }
}
