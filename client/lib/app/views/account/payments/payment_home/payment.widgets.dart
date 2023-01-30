import 'package:client/app/l10n/app_l10n.dart';

import 'package:client/app/views/account/payments/payment_home/payment.viewmodel.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class PaymentsWidgets {
  Widget body(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingNormal,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: PaymentViewModel().accountItems(context).length,
        itemBuilder: (context, index) {
          var key = PaymentViewModel().accountItems(context)[index];
          return InkWell(
            onTap: key['onTap'],
            child: ListTile(
              leading: CustomIcon(
                imagePath: key['icon'],
                height: IconSize.large,
                width: IconSize.large,
              ),
              title: Text(
                key['title'],
                style: TextConstants.instance.button1.copyWith(
                  color: buildItemColor(context, key['title']),
                ),
              ),
              trailing: key['trailing'],
            ),
          );
        },
      ),
    );
  }

  buildItemColor(BuildContext context, title) {
    return (title == L10n.of(context)!.logout) ? ColorConstant.instance.red0 : ColorConstant.instance.dark0;
  }
}
