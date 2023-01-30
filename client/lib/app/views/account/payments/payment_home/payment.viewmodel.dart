import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/payments/add_card/widgets/add_payment_bottom_sheet.dart';
import 'package:client/app/views/account/widgets/alert_bottom_sheet.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_bottom_sheet.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class PaymentViewModel extends BaseViewModel {
  List<Map> paymentsSelect = [];

  List<Map> accountItems(BuildContext context) {
    paymentsSelect = [
      {
        "icon": Assets.icons.applePay.path,
        "title": L10n.of(context)!.applePay,
        "trailing": CustomTextButton(
            onPressed: () {
              deleteBottomSheet(context, 0);
            },
            text: L10n.of(context)!.remove,
            color: ButtonColor.red),
        "onTap": () {},
      },
      {
        "icon": Assets.icons.cash.path,
        "title": L10n.of(context)!.cash,
        "trailing": const Icon(Icons.arrow_forward_ios_sharp, size: 15),
        "onTap": () {},
      },
      {
        "icon": Assets.icons.creditCard.path,
        "title": "4153 xxxx xxxxx 0981",
        "trailing": CustomTextButton(
            onPressed: () {
              deleteBottomSheet(context, 2);
            },
            text: L10n.of(context)!.remove,
            color: ButtonColor.red),
        "onTap": () {},
      },
      {
        "icon": Assets.icons.addMethod.path,
        "title": L10n.of(context)!.addPaymentMehod,
        "trailing": const SizedBox(),
        "onTap": () {
          CustomBottomSheet.buildCustomBottomSheet(
            context: context,
            widget: const AddPaymentBottomSheet(),
          );
        },
      },
    ];
    notifyListeners();
    return paymentsSelect;
  }

  deleteBottomSheet(BuildContext context, int payIndex) {
    return CustomBottomSheet.buildCustomBottomSheet(
      context: context,
      widget: AlertBottomSheet(
        title: L10n.of(context)!.isDelete,
        subTitle: L10n.of(context)!.deletePayment,
        redButtonText: L10n.of(context)!.delete,
        whiteButtonText: L10n.of(context)!.cancel,
        paymentIndex: payIndex,
      ),
    );
  }

  removePayment(BuildContext context, int index) {
    accountItems(context).removeAt(index);
    notifyListeners();
  }
}
