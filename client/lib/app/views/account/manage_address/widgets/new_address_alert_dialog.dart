import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/manage_address/manage_address.viewmodel.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_alet_dialog.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewAddresAlertDialog extends StatelessWidget {
  const NewAddresAlertDialog({
    super.key,
    required this.isNewAddress,
    this.index,
  });
  final bool isNewAddress;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ManageAddressViewModel>(context);
    return CustomAlertDialog(
      title: isNewAddress
          ? L10n.of(context)!.newAddress
          : L10n.of(context)!.editAddress,
      child: Wrap(
        runSpacing: 10,
        children: [
          CustomTextFormField(
            labelTextValue: L10n.of(context)!.addressTitle,
            hintText: L10n.of(context)!.office,
            controller: provider.addressTitleController,
          ),
          CustomTextFormField(
            labelTextValue: L10n.of(context)!.address,
            hintText: "...",
            controller: provider.addressController,
          ),
          isNewAddress
              ? SizedBox(
                  width: context.dynamicWidth(1),
                  child: CustomElevatedButton(
                    text: L10n.of(context)!.add,
                    textColor: ButtonColor.light,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      provider.addAddress({
                        "addressTitle": provider.addressTitleController.text,
                        "address": provider.addressController.text,
                      }, context);

                      Navigator.pop(context);
                    },
                  ),
                )
              : SizedBox(
                  width: context.dynamicWidth(1),
                  child: CustomElevatedButton(
                    text: L10n.of(context)!.edit,
                    textColor: ButtonColor.light,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      provider.editAddress({
                        "addressTitle": provider.addressTitleController.text,
                        "address": provider.addressController.text,
                      }, index);

                      Navigator.pop(context);
                    },
                  ),
                )
        ],
      ),
    );
  }
}
