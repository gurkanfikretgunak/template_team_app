import 'package:client/app/views/shop/widget/shop_tile.dart';
import 'package:client/app/widgets/system_ui_overlay/navigation/custom_navigation.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import '../../widgets/image_viewer/icons/icons_widgets.dart';
import '../../widgets/system_ui_overlay/navigation/navigation_select.dart';

class ShopWidgets {
  Widget shopBody(BuildContext context) {
    return Padding(
      padding: context.onlyLRTBpaddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationsWidget(false, () {}, Navigations.back, "Woodlands Hill Salon"),
                  const Text("Haircut, Spa, Message"),
                  const Text("Keira throughway * 5.0 Kms, "),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CustomIcon(imagePath: "assets/icons/phone.png", height: IconSize.large, width: IconSize.large),
                      CustomIcon(
                          imagePath: "assets/icons/pin-outline.png", height: IconSize.large, width: IconSize.large),
                      CustomIcon(imagePath: "assets/icons/share.png", height: IconSize.large, width: IconSize.large),
                      CustomIcon(imagePath: "assets/icons/heart.png", height: IconSize.large, width: IconSize.large),
                    ],
                  ),
                  ShopListWidget()
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
