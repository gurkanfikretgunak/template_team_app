import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/booking_detail/widgets/booking_date_and_location.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/favorite_icon.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../widgets/list_items/list_items_widget.dart';

class BookingDetailWidgets {
  appBar(BuildContext context) {
    return CustomAppbar(title: L10n.of(context)!.bookingDetail);
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
            bookingTitle(),
            BookingDateAndLocation(
                iconPath: Assets.icons.shop.path, text: "Shop Service"),
            const CustomDivider(type: DividerType.dashed),
            BookingDateAndLocation(
                iconPath: Assets.icons.calender.path, text: "10 March 2021"),
            const CustomDivider(type: DividerType.dashed),
            orderItemList(),
            const CustomDivider(type: DividerType.dashed),
            totalInformations(context),
            SizedBox(
              width: context.dynamicWidth(1),
              child: CustomElevatedButton(
                onPressed: () {},
                text: L10n.of(context)!.reorderBooking,
                textColor: ButtonColor.light,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row bookingTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Woodlands Hills Salon", style: TextConstants.instance.heading6),
        const FavoriteIcon(isFavorite: false)
      ],
    );
  }

  Widget totalInformations(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        totalRowStyle(text: L10n.of(context)!.itemTotal, price: "-\$210"),
        totalRowStyle(text: L10n.of(context)!.couponDiscount, price: "-\$210"),
        const CustomDivider(),
        totalRowStyle(
            text: L10n.of(context)!.grandTotal,
            price: "-\$210",
            isGrandTotal: true),
      ],
    );
  }

  Wrap totalRowStyle(
      {required String text, required String price, bool? isGrandTotal}) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style:
                  isGrandTotal != null ? TextConstants.instance.button2 : null,
            ),
            Text(
              price,
              style: isGrandTotal != null
                  ? TextConstants.instance.button1
                  : TextStyle(color: ColorConstant.instance.green0),
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
        return OrderItemsTile(productName: L10n.of(context)!.haircut);
      },
    );
  }
}
