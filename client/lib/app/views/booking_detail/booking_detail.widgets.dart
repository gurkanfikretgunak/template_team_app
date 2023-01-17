import 'package:client/app/views/booking_detail/widgets/booking_date_and_location.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/favorite_icon.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../widgets/list_items/list_items_widget.dart';

class BookingDetailWidgets {
  appBar(BuildContext context) {
    return CustomAppbar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.close,
          color: ColorConstant.instance.dark0,
        ),
      ),
    );
  }

  body(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Details", style: TextConstants.instance.heading5),
          bookingTitle(),
          const BookingDateAndLocation(iconPath: "assets/icons/shop.png", text: "Shop Service"),
          const CustomDivider(type: DividerType.dashed),
          const BookingDateAndLocation(iconPath: "assets/icons/calender.png", text: "10 March 2021"),
          const CustomDivider(type: DividerType.dashed),
          orderItemList(),
          const CustomDivider(type: DividerType.dashed),
          totalInformations(),
          CustomElevatedButton(onPressed: () {}, text: "Reorder Booking")
        ],
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

  ListView totalInformations() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Grand Total"),
            Text("-\$210", style: TextStyle(color: ColorConstant.instance.green0)),
          ],
        );
      },
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
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return const OrderItemsTile(productName: "Haircut");
      },
    );
  }
}
