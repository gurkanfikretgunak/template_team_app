import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/filter_bottom_sheet/filter_bottom_sheet.view.dart';
import 'package:client/app/widgets/buttons/widgets/chip_button.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class RatingButton extends BaseView {
  const RatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChipButton(
      color: ColorConstant.instance.light4,
      isBorder: true,
      onTap: () {
        bottomSheet(context);
      },
      widget: FittedBox(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 5,
          children: [
            CustomIcon(
              imagePath: Assets.icons.arrowUpArrowDown.path,
              height: IconSize.medium,
            ),
            Text(
              L10n.of(context)!.rating,
              style: TextConstants.instance.subtitle2,
            ),
          ],
        ),
      ),
    );
  }

  bottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const FilterBottomSheet();
      },
    );
  }
}
