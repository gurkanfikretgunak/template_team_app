import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/filter_bottom_sheet/filter_bottom_sheet.viewmodel.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/gender/gender.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/gender/gender_notifier.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/sort/sort.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/timing/timing.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/timing/timing_notifier.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/inputs/widgets/radio_button/radio_button_notifier.dart';

class FilterBottomSheetWidgets {
  Widget appBar(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.onlyTopPaddingLow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: CustomIcon(
                    imagePath: Assets.icons.close.path,
                    height: IconSize.large,
                    width: IconSize.large,
                  ),
                ),
                Text(L10n.of(context)!.sortFilters,
                    style: TextConstants.instance.button1),
              ],
            ),
            CustomTextButton(
              onPressed: () {
                // Provider.of<GenderNotifier>(context, listen: false).clear();
                Provider.of<TimingNotifier>(context, listen: false).clear();
                Provider.of<RadioButtonNotifier>(context, listen: false)
                    .setSelectedOption(L10n.of(context)!.popularity);
              },
              text: L10n.of(context)!.clearAll,
            )
          ],
        ),
      ),
    );
  }

  Widget filterTitle(BuildContext context) {
    final provider = Provider.of<FilterBottomSheetViewModel>(context);

    return Container(
      color: ColorConstant.instance.light2,
      child: Align(
        alignment: Alignment.topLeft,
        child: ListView.builder(
          itemCount: provider.filterCetegoryList(context).length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                provider.selectedCategory = index;
              },
              child: Container(
                height: context.dynamicHeight(0.07),
                decoration: BoxDecoration(
                  color: provider.selectedCategory == index
                      ? ColorConstant.instance.light4
                      : ColorConstant.instance.light2,
                  border: Border(
                    bottom: BorderSide(color: ColorConstant.instance.dark4),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: context.horizontalPaddingNormal,
                    child: Text(
                      provider.filterCetegoryList(context)[index],
                      style: TextStyle(
                        color: provider.selectedCategory == index
                            ? ColorConstant.instance.dark0
                            : ColorConstant.instance.dark3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildCategoryBodyWidget(BuildContext context) {
    final provider = Provider.of<FilterBottomSheetViewModel>(context);

    switch (provider.selectedCategory) {
      case 0:
        return const SortFilter();
      case 1:
        return const Text("Offers");
      case 2:
        return const GenderFilter();
      case 3:
        return const TimingFilter();
      default:
        return const Text("Timing");
    }
  }
}
