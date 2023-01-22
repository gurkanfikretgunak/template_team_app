import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class PromoWidgets {
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
          runSpacing: 30,
          children: [
            Text("Offers & Promo Codes", style: TextConstants.instance.heading5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Flexible(
                  child: CustomTextFormField(hintText: 'Enter Coupon Code', labelTextValue: 'Coupon Code'),
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: 'Apply',
                )
              ],
            ),
            const CustomDivider(type: DividerType.dashed),
            applyOffers(),
          ],
        ),
      ),
    );
  }

  Column applyOffers() {
    List<Map<String, dynamic>> offers = [
      {
        'offerCustomIcon': Assets.icons.visa.path,
        'offerTitle': 'Get cashback upto \$40 on VISA Debit or Credit cards',
        'offerSubtitle': 'On booking of \$200 or more.',
        'onPressed': () {},
      },
      {
        'offerCustomIcon': Assets.icons.visa.path,
        'offerTitle': 'Get cashback upto \$50 using PayPal',
        'offerSubtitle': 'On booking of \$200 or more.',
        'onPressed': () {},
      },
    ];
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return OffersTile(
              offerCustomIcon: offers[index]['offerCustomIcon'],
              offerTitle: offers[index]['offerTitle'],
              offerSubtitle: offers[index]['offerSubtitle'],
              onPressed: offers[index]['onPressed'],
            );
          },
        )
      ],
    );
  }
}
