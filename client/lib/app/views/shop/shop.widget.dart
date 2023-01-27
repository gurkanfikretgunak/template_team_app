import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/shop/shop_card_widget.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/image_viewer/icons/widgets/custom_icons.dart';

class ShopHomeWidgets {
  Widget body(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              NavigationService.instance.navigateToPage(Routes.shopDetail.name);
            },
            child: Padding(
              padding: context.paddingNormal,
              child: ShopSpeacialCard(
                imageFlex: 3,
                cardHeight: 260,
                cardWidth: context.dynamicWidth(0.3),
                imageWidth: 500,
                shopModel: MockShop.bookingList(context)[index],
              ),
            ),
          );
        },
        childCount: 3,
      ),
    );
  }

  Widget dropDownCity(BuildContext context, bool isLight) {
    final provider = Provider.of<HomeViewModel>(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          CustomIcon(
              imagePath: Assets.icons.location.path,
              iconColor: isLight ? ColorConstant.instance.light4 : ColorConstant.instance.dark0),
          DropdownButton<String>(
            dropdownColor: ColorConstant.instance.light0,
            value: provider.ddLocationValue,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            elevation: 16,
            style: TextConstants.instance.button1.copyWith(color: ColorConstant.instance.dark0),
            underline: Container(height: 0),
            onChanged: (String? value) {
              provider.ddLocationValue = value!;
            },
            items: provider.locationList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextConstants.instance.button1.copyWith(
                      color: value == provider.ddLocationValue
                          ? ColorConstant.instance.light4
                          : ColorConstant.instance.dark0),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
