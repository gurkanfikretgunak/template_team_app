import 'package:client/app/views/shop_detail/widget/offer_box.dart';
import 'package:client/app/views/shop_detail/widget/shop_tile.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_outlined_button.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/inputs/widgets/shop_cards/shop_card_widgets.dart';
import 'package:client/app/widgets/system_ui_overlay/navigation/custom_navigation.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import '../../widgets/image_viewer/icons/icons_widgets.dart';
import '../../widgets/system_ui_overlay/navigation/navigation_select.dart';

class ShopDetailWidgets {
  Widget shopDetailAppBar(
      BuildContext context, String shopName, String address, String shopTypes, double rating, double? discountAmount) {
    return Stack(
      children: [
        SizedBox(width: context.width, child: Image.asset(Assets.images.shop.homeShop1.path, fit: BoxFit.cover)),
        NavigationsWidget(true, () {
          Navigator.pop(context);
        }, Navigations.back, "null", const SizedBox()),
        Padding(
          padding: context.paddingNormal,
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShopCardWidgets()
                      .shopInformation(context, shopName, shopTypes, rating, address, discountAmount, true),
                  CustomIcon(
                      imagePath: "assets/icons/heart.png",
                      height: IconSize.large,
                      width: IconSize.large,
                      iconColor: ColorConstant.instance.light4),
                ],
              )),
        ),
      ],
    );
  }

  Widget shopDetailBody(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        CustomIcon(imagePath: "assets/icons/phone.png", height: IconSize.large, width: IconSize.large),
                        Text("Call")
                      ],
                    ),
                    Column(
                      children: const [
                        CustomIcon(
                            imagePath: "assets/icons/pin-outline.png", height: IconSize.large, width: IconSize.large),
                        Text("Directions")
                      ],
                    ),
                    Column(
                      children: const [
                        CustomIcon(imagePath: "assets/icons/share.png", height: IconSize.large, width: IconSize.large),
                        Text("Share")
                      ],
                    ),
                  ],
                ),
              ),
              CustomOutlinedButton(
                onPressed: () {},
                buttonSize: ButtonSize.small,
                child: Row(children: const [Icon(Icons.star_border_outlined), Text("4.1")]),
              )
            ],
          ),
          CustomDivider(
            type: DividerType.dashed,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [OfferBoxWidget(), OfferBoxWidget()],
          ),
          const ShopListWidget()
        ],
      ),
    );
  }
}
