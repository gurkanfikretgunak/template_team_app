import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/manage_address/manage_address.viewmodel.dart';
import 'package:client/app/views/account/widgets/alert_bottom_sheet.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/custom_bottom_sheet.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageAddressWidgets {
  CustomAppbar appbar(BuildContext context) {
    return CustomAppbar(
      titleWidget: SizedBox(
          width: context.dynamicWidth(0.81),
          child: Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                  onPressed: () {
                    _showAlertDialog(context, isNewAddress: true);
                  },
                  text: "+ ${L10n.of(context)!.newAddress}"))),
    );
  }

  _showAlertDialog(BuildContext context, {required bool isNewAddress}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _AlertDialogWidget(
          isNewAddress: isNewAddress,
        );
      },
    );
  }

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
          onPressed: () {
            _showAlertDialog(context, isNewAddress: false);
          },
          text: L10n.of(context)!.edit,
        ),
      ],
    );
  }
}

class _AlertDialogWidget extends StatelessWidget {
  const _AlertDialogWidget({required this.isNewAddress});
  final bool isNewAddress;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ManageAddressViewModel>(context);
    return AlertDialog(
      content: SizedBox(
        width: context.dynamicWidth(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                isNewAddress
                    ? L10n.of(context)!.newAddress
                    : L10n.of(context)!.editAddress,
                style: TextConstants.instance.heading6
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
            ]),
            CustomTextFormField(
              hintText: L10n.of(context)!.addressName,
            ),
            Text('${L10n.of(context)!.country} / ${L10n.of(context)!.city}'),
            Container(
              margin: context.verticalPaddingNormal,
              padding: context.horizontalPaddingLow,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(width: 1, color: ColorConstant.instance.dark4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    underline: const SizedBox(),
                    value: provider.ddCountryValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: provider.countryList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      provider.ddCountryValue = newValue!;
                    },
                  ),
                  const Text('/'),
                  DropdownButton(
                    underline: const SizedBox(),
                    value: provider.ddCityValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: provider.cityList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      provider.ddCityValue = newValue!;
                    },
                  ),
                ],
              ),
            ),
            CustomTextFormField(
              hintText: L10n.of(context)!.address,
            ),
            Center(
              child: CustomElevatedButton(
                onPressed: () {},
                text: isNewAddress
                    ? L10n.of(context)!.add
                    : L10n.of(context)!.edit,
                textColor: ButtonColor.light,
              ),
            )
          ],
        ),
      ),
    );
  }
}
