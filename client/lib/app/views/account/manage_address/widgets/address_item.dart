import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/manage_address/widgets/new_address_alert_dialog.dart';
import 'package:client/app/views/account/widgets/alert_bottom_sheet.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_bottom_sheet.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.listItem,
    required this.index,
  });
  final dynamic listItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingNormal,
      child: Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          buildHomeIcon(),
          Wrap(
            spacing: 5,
            direction: Axis.vertical,
            children: [
              Padding(
                padding: context.horizontalPaddingLow,
                child: Text(
                  listItem['addressTitle'],
                  style: TextConstants.instance.label1.copyWith(fontSize: 17),
                ),
              ),
              Padding(
                padding: context.horizontalPaddingLow,
                child: SizedBox(
                  width: context.dynamicWidth(0.7),
                  child: Text(
                    listItem['address'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              buildButtons(context)
            ],
          ),
        ],
      ),
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

  Widget buildButtons(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        CustomTextButton(
          onPressed: () {
            CustomBottomSheet.buildCustomBottomSheet(
              context: context,
              widget: AlertBottomSheet(
                itemIndex: index,
                title: L10n.of(context)!.isDeleteAddress,
                subTitle: L10n.of(context)!.isDeleteAddressDesc,
                redButtonText: L10n.of(context)!.delete,
                whiteButtonText: L10n.of(context)!.cancel,
              ),
            );
          },
          text: L10n.of(context)!.delete,
        ),
        CustomTextButton(
          onPressed: () {
            _showAlertDialog(context, index, isNewAddress: false);
          },
          text: L10n.of(context)!.edit,
        ),
      ],
    );
  }

  _showAlertDialog(BuildContext context, index, {required bool isNewAddress}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NewAddresAlertDialog(
          isNewAddress: isNewAddress,
          index: index,
        );
      },
    );
  }
}
