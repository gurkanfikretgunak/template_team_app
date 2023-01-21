import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesWidgets {
  Widget body(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Consumer<BookingViewModel>(builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.favoriteBookings.length,
          itemBuilder: (context, index) {
            return BookingCard(booking: value.favoriteBookings[index]);
          },
        );
      }),
    );
  }
}
