import 'package:client/app/views/filter_bottom_sheet/filter_bottom_sheet.viewmodel.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/gender/gender.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/sort/sort.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/timing/timing.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBottomSheetWidgets {
  Widget appBar(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.onlyTopPaddingLow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // crossAxisAlignment: WrapCrossAlignment.center,
              // spacing: 10,
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
                Text("Sort/Filters", style: TextConstants.instance.button1),
              ],
            ),
            CustomTextButton(
              onPressed: () {},
              text: " Clear all",
            )
          ],
        ),
      ),
    );
  }

  Widget filterTitle(BuildContext context) {
    final provider = Provider.of<FilterBottomSheetViewModel>(context);
    List<String> filterCetegoryList = ["Sort", "Offers", "Gender", "Timing"];

    return Container(
      color: ColorConstant.instance.light2,
      child: Align(
        alignment: Alignment.topLeft,
        child: ListView.builder(
          itemCount: filterCetegoryList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                provider.selectedCategory = filterCetegoryList[index];
              },
              child: Container(
                height: context.dynamicHeight(0.06),
                decoration: BoxDecoration(
                  color: provider.selectedCategory == filterCetegoryList[index]
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
                      filterCetegoryList[index],
                      style: TextStyle(
                        color: provider.selectedCategory ==
                                filterCetegoryList[index]
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
      case "Sort":
        return const SortFilter();
      case "Offers":
        return const Text("Offers");
      case "Gender":
        return const GenderFilter();
      case "Timing":
        return const TimingFilter();
      default:
        return const Text("Timing");
    }
  }
}
