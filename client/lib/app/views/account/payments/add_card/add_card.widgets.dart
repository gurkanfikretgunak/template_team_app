import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/custom_icons.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/icon_size.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AddCardWidgets {
  Widget body(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cardInformationTextFields(context),
          addCardButton(context),
        ],
      ),
    );
  }

  SizedBox addCardButton(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(1),
      child: CustomElevatedButton(
        onPressed: () {},
        textColor: ButtonColor.light,
        text: L10n.of(context)!.addCard,
        buttonSize: ButtonSize.large,
      ),
    );
  }

  Widget cardInformationTextFields(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(labelTextValue: L10n.of(context)!.nameOnCard),
        CustomTextFormField(
          labelTextValue: L10n.of(context)!.cardNumber,
          prefixIcon: const Icon(Icons.credit_card_outlined),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.dynamicWidth(0.4),
              child: CustomTextFormField(
                labelTextValue: L10n.of(context)!.expDate,
                hintText: "MM//YY",
              ),
            ),
            SizedBox(
              width: context.dynamicWidth(0.4),
              child: CustomTextFormField(
                labelTextValue: L10n.of(context)!.cvv,
                hintText: "123",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
