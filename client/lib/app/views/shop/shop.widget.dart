import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/home/home.widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/image_viewer/icons/widgets/custom_icons.dart';

class ShopHomeWidgets {
  Widget appBarBody(BuildContext context) {
    return Stack(
      children: [
        SizedBox(width: context.width, child: Image.asset(Assets.images.shop.homeShop1.path, fit: BoxFit.cover)),
        BackButton(
          color: ColorConstant.instance.light4,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        dropDownCity(context, true),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: context.paddingNormal,
              child: SizedBox(
                width: 300,
                child: Text(
                  "Haircut for Men",
                  style: TextConstants.instance.heading3.copyWith(color: ColorConstant.instance.light4),
                ),
              ),
            )),
      ],
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50, child: FilterList()),
            context.emptySizedHeightBoxLow,
            Text("102 shops giving Haircut service", style: TextConstants.instance.label1),
            context.emptySizedHeightBoxLow,
            GestureDetector(
                onTap: () {
                  NavigationService.instance.navigateToPage(Routes.shopDetail.name);
                },
                child: ShopList(
                    imageFlex: 3,
                    cardHeight: 300,
                    cardWidth: context.dynamicWidth(0.3),
                    isHorizontal: false,
                    listHeight: 500)),
          ],
        ),
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
            value: provider.ddLocationValue,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            elevation: 16,
            style: TextConstants.instance.button1
                .copyWith(color: isLight ? ColorConstant.instance.light4 : ColorConstant.instance.dark0),
            underline: Container(height: 0),
            onChanged: (String? value) {
              provider.ddLocationValue = value!;
            },
            items: provider.locationList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
