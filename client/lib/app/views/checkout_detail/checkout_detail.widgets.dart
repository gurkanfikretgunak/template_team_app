import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import 'widgets/select_date.dart';

class CheckoutDetailWidgets {
  appBar(BuildContext context) {
    return const CustomAppbar();
  }

  body(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: context.paddingNormal,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 20,
              children: [
                Text("Checkout", style: TextConstants.instance.heading5),
                checkoutTitle(text: "Select Date & Time for the appointment"),
                const SelectDate()
              ],
            ),
          ),
        ),
        const CheckoutButton(itemCount: 2, totalPrice: 449)
      ],
    );
  }

  Row checkoutTitle({required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextConstants.instance.heading6),
      ],
    );
  }
}
