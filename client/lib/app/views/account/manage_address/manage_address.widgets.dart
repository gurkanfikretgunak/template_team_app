import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/widgets/alert_bottom_sheet.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_bottom_sheet.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ManageAddressWidgets {
  Widget body() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) {
        return const CustomDivider(type: DividerType.dashed);
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: context.paddingNormal,
          child: Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              buildHomeIcon(),
              buildInformation(context),
            ],
          ),
        );
      },
    );
  }

  CircleAvatar buildHomeIcon() {
    return CircleAvatar(
      backgroundColor: ColorConstant.instance.light0,
      child: CustomIcon(
        imagePath: Assets.icons.home.path,
        height: IconSize.large,
      ),
    );
  }

  Wrap buildInformation(BuildContext context) {
    return Wrap(
      spacing: 5,
      direction: Axis.vertical,
      children: [
        Padding(
          padding: context.horizontalPaddingLow,
          child: Text(
            L10n.of(context)!.home,
            style: TextConstants.instance.label1.copyWith(fontSize: 17),
          ),
        ),
        Padding(
          padding: context.horizontalPaddingLow,
          child: const Text('3944 Water Street, Walnut Creek, California'),
        ),
        buildButtons(context)
      ],
    );
  }

  Wrap buildButtons(BuildContext context) {
    return Wrap(
      children: [
        CustomTextButton(
          onPressed: () {
            CustomBottomSheet.buildCustomBottomSheet(
              context: context,
              widget: AlertBottomSheet(
                title: L10n.of(context)!.isDeleteAddress,
                subTitle: L10n.of(context)!.isDeleteAddressDesc,
                redButtonText: L10n.of(context)!.delete,
              ),
            );
          },
          text: L10n.of(context)!.delete,
        ),
        CustomTextButton(
          onPressed: () {},
          text: L10n.of(context)!.edit,
        ),
      ],
    );
  }
}
