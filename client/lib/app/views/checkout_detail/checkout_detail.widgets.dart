import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_l10n.dart';
import 'widgets/select_date.dart';

class CheckoutDetailWidgets {
  appBar(BuildContext context) {
    return const CustomAppbar();
  }

  body(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: context.paddingNormal,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 20,
          children: [
            Text(L10n.of(context)!.checkout, style: TextConstants.instance.heading5),
            checkoutTitle(text: "${L10n.of(context)!.selectDateTime} ${L10n.of(context)!.forTheAppointment}"),
            const SelectDate()
          ],
        ),
      ),
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
