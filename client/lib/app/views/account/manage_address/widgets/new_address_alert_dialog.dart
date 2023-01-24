import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/manage_address/manage_address.viewmodel.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewAddresAlertDialog extends StatelessWidget {
  const NewAddresAlertDialog({super.key, required this.isNewAddress});
  final bool isNewAddress;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ManageAddressViewModel>(context);
    return AlertDialog(
      content: SingleChildScrollView(
        child: SizedBox(
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
      ),
    );
  }
}
