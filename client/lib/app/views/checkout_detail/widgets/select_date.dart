import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/app/widgets/system_ui_overlay/payment_select/bottom_sheet.widget.dart';
import 'package:client/app/widgets/system_ui_overlay/payment_select/custom_bottom_sheet.dart';
import 'package:client/app/widgets/system_ui_overlay/payment_select/payment_list.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_l10n.dart';

class SelectDate extends StatelessWidget {
  const SelectDate({super.key});

  @override
  Widget build(BuildContext context) {
    List<Payments> payments = [Payments.apple, Payments.cash, Payments.visa, Payments.add];
    List<String> paymentsName = ['Apple Pay', 'Cash', 'Visa', 'Add payment method'];
    List<VoidCallback> paymentOnPressed = [() {}, () {}, () {}, () {}];
    return Wrap(
      runSpacing: 20,
      children: [
        Text(L10n.of(context)!.whenWouldLike),
        datePicker(context),
        Text(L10n.of(context)!.whenWouldLike),
        timePicker(context),
        InkWell(
            onTap: () {
              CustomOverlayWidget.settingModalBottomSheet(
                context,
                BottomSheetWidget(
                  paymentMethods: payments,
                  paymentName: paymentsName,
                  onPressed: paymentOnPressed,
                ),
              );
            },
            child: PaymentTile(customIconPath: Assets.icons.applePay.path, paymentName: 'Apple Pay')),
      ],
    );
  }

  GridView timePicker(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            margin: context.horizontalPaddingLow,
            width: context.dynamicWidth(0.2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: ColorConstant.instance.light1),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [Text('11:30 ${L10n.of(context)!.am}')],
            ),
          ),
        );
      },
    );
  }

  SizedBox datePicker(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.08),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: context.horizontalPaddingLow,
              width: context.dynamicWidth(0.2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: ColorConstant.instance.light1),
              ),
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 10,
                children: [Text(L10n.of(context)!.day), Text('$index')],
              ),
            ),
          );
        },
      ),
    );
  }
}
