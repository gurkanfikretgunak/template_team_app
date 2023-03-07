import 'package:client/app/l10n/app_l10n.dart';
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
            Text(L10n.of(context)!.offersPromoCode,
                style: TextConstants.instance.heading5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: CustomTextFormField(
                      isVisible: false,
                      hintText: L10n.of(context)!.enterCouponCode,
                      labelTextValue: L10n.of(context)!.couponCode),
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: L10n.of(context)!.apply,
                )
              ],
            ),
            const CustomDivider(type: DividerType.dashed),
            applyOffers(context),
          ],
        ),
      ),
    );
  }

  Column applyOffers(BuildContext context) {
    List<Map<String, dynamic>> offers = [
      {
        'offerCustomIcon': Assets.images.shop.visaCheck.path,
        'offerTitle':
            '${L10n.of(context)!.getcashbackUpto}  ${L10n.of(context)!.getVisaCredits}',
        'offerSubtitle': L10n.of(context)!.onBookingOf,
        'onPressed': () {},
      },
      {
        'offerCustomIcon': Assets.images.shop.paypalCheck.path,
        'offerTitle':
            '${L10n.of(context)!.getcashbackUpto}  ${L10n.of(context)!.getUsingPaypal}',
        'offerSubtitle': L10n.of(context)!.onBookingOf,
        'onPressed': () {},
      },
    ];
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                OffersTile(
                  offerCustomIcon: offers[index]['offerCustomIcon'],
                  offerTitle: offers[index]['offerTitle'],
                  offerSubtitle: offers[index]['offerSubtitle'],
                  onPressed: offers[index]['onPressed'],
                ),
                context.emptySizedHeightBoxNormal
              ],
            );
          },
        )
      ],
    );
  }
}
