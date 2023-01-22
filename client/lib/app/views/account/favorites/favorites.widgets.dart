import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesWidgets {
  Widget body(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Consumer<BookingViewModel>(builder: (context, value, child) {
        return value.favoriteBookings.isEmpty
            ? favoriteListEmptyAlert(context)
            : favoriteList(value);
      }),
    );
  }

  ListView favoriteList(BookingViewModel value) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: value.favoriteBookings.length,
      itemBuilder: (context, index) {
        return BookingCard(booking: value.favoriteBookings[index]);
      },
    );
  }

  Widget favoriteListEmptyAlert(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 60,
            backgroundColor: ColorConstant.instance.purple4,
            child: Icon(Icons.add_chart,
                size: 40, color: ColorConstant.instance.dark2),
          ),
          context.emptySizedHeightBoxNormal,
          context.emptySizedHeightBoxNormal,
          Text(
            L10n.of(context)!.emptyFavoritedList,
            style: TextConstants.instance.label1.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
