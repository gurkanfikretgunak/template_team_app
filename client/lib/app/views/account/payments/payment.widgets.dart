import 'package:client/app/views/account/payments/payment.viewmodel.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

class PaymentsWidgets {
  Widget body(BuildContext context) {
    return ListView.builder(
      itemCount: PaymentViewModel().accountItems(context).length,
      itemBuilder: (context, index) {
        var key = PaymentViewModel().accountItems(context)[index];
        return InkWell(
          onTap: () {
            key['onTap'];
          },
          child: ListTile(
            leading: CustomIcon(
              imagePath: key['icon'],
              height: IconSize.large,
              width: IconSize.large,
            ),
            title: Text(
              key['title'],
              style: TextConstants.instance.button1.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: key['trailing'],
          ),
        );
      },
    );
    ;
  }
}
