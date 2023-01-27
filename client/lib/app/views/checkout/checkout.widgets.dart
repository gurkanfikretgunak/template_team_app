import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/checkout/widgets/checkout_tile.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CheckoutWidgets {
  appBar(BuildContext context) {
    return const CustomAppbar();
  }

  body(BuildContext context, ScrollController controller) {
    return SingleChildScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: context.paddingNormal + context.onlyBottomPaddingHigh,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 20,
          children: [
            Text(L10n.of(context)!.checkout, style: TextConstants.instance.heading5),
            checkoutTitle(text: 'Cosmo Life ${L10n.of(context)!.beautyCentre}'),
            Column(
              children: [
                CheckoutTile(iconPath: Assets.icons.shop.path, text: L10n.of(context)!.shopService),
                const CustomDivider(type: DividerType.dashed),
                CheckoutTile(
                  iconPath: Assets.icons.calender.path,
                  text: L10n.of(context)!.selectDateTime,
                  hasTrailing: true,
                  onTap: () {
                    NavigationService.instance.navigateToPage(Routes.checkoutDetail.name);
                  },
                ),
                const CustomDivider(type: DividerType.dashed),
                orderItemList(context),
                ShopPromoTile(
                  onTap: () {
                    NavigationService.instance.navigateToPage(Routes.promo.name);
                  },
                ),
                frequentlyTogether(
                  buttonText: L10n.of(context)!.select,
                  context: context,
                ),
                totalInformations(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column frequentlyTogether({String? buttonText, BuildContext? context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(L10n.of(context!)!.frequentlyAdded, style: TextConstants.instance.label1),
        Padding(
          padding: context.verticalPaddingLow,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SizedBox(
                    height: 160,
                    child: frequentlyTogetherList(buttonText: buttonText, padding: context.onlyRightPaddingMedium)),
              ),
            ],
          ),
        )
      ],
    );
  }

  ListView frequentlyTogetherList({String? buttonText, required EdgeInsetsGeometry padding}) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.images.shop.shopDetail2.path),
              Text(L10n.of(context)!.haircut, style: TextConstants.instance.subtitle1),
              Text("\$40", style: TextConstants.instance.button2),
              CustomOutlinedButton(
                buttonSize: ButtonSize.small,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonText ?? L10n.of(context)!.select,
                      style: TextConstants.instance.label2.copyWith(color: ColorConstant.instance.purple2),
                    ),
                    CustomIcon(imagePath: Assets.icons.addMethod.path, iconColor: ColorConstant.instance.purple2)
                  ],
                ),
              ),
            ],
          ),
        );
      },
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

  Widget totalInformations(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        totalRowStyle(text: L10n.of(context)!.itemTotal, price: "\$112", textColor: ColorConstant.instance.dark0),
        totalRowStyle(text: L10n.of(context)!.couponDiscount, price: "-\$10"),
        const CustomDivider(),
        totalRowStyle(text: L10n.of(context)!.amountPayable, price: "\$30", isGrandTotal: true),
      ],
    );
  }

  Wrap totalRowStyle({required String text, required String price, bool? isGrandTotal, Color? textColor}) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: isGrandTotal != null ? TextConstants.instance.button2 : null,
            ),
            Text(
              price,
              style: isGrandTotal != null
                  ? TextConstants.instance.button1
                  : TextStyle(color: textColor ?? ColorConstant.instance.green0),
            ),
          ],
        ),
      ],
    );
  }

  Row amountInformation({required String text, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Text(price),
      ],
    );
  }

  ListView orderItemList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return OrderItemsTile(
          productName: L10n.of(context)!.shave,
          isOrder: true,
        );
      },
    );
  }
}
