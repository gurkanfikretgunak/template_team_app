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
                checkoutTitle(text: "Woodlands Hills Salon"),
                Column(
                  children: [
                    CheckoutTile(iconPath: Assets.icons.shop.path, text: "Shop Service"),
                    const CustomDivider(type: DividerType.dashed),
                    CheckoutTile(
                      iconPath: Assets.icons.calender.path,
                      text: "Select Date & Time",
                      hasTrailing: true,
                      onTap: () {
                        NavigationService.instance.navigateToPage(Routes.checkoutDetail.name);
                      },
                    ),
                    const CustomDivider(type: DividerType.dashed),
                    orderItemList(),
                    ShopPromoTile(
                      onTap: () {
                        NavigationService.instance.navigateToPage(Routes.promo.name);
                      },
                    ),
                    frequentlyTogether(
                      buttonText: L10n.of(context)!.select,
                      context: context,
                    ),
                    totalInformations(),
                  ],
                )
              ],
            ),
          ),
        ),
        const CheckoutButton(itemCount: 2, totalPrice: 449)
      ],
    );
  }

  Column frequentlyTogether({String? buttonText, BuildContext? context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Frequently added together", style: TextConstants.instance.label1),
        Padding(
          padding: context!.verticalPaddingLow,
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
              Text("Haircut", style: TextConstants.instance.subtitle1),
              Text("\$40", style: TextConstants.instance.button2),
              CustomOutlinedButton(
                buttonSize: ButtonSize.small,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonText ?? "Select",
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

  Widget totalInformations() {
    return Wrap(
      runSpacing: 20,
      children: [
        totalRowStyle(text: "Item Total", price: "\$112", textColor: ColorConstant.instance.dark0),
        totalRowStyle(text: "Coupon Discount", price: "-\$10"),
        const CustomDivider(),
        totalRowStyle(text: "Amount Payable", price: "\$30", isGrandTotal: true),
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

  ListView orderItemList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return const OrderItemsTile(
          productName: "Haircut",
          isOrder: true,
        );
      },
    );
  }
}
