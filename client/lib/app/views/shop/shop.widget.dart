import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/home/home.widgets.dart';
import 'package:client/app/widgets/system_ui_overlay/navigation/custom_navigation.dart';
import 'package:client/app/widgets/system_ui_overlay/navigation/navigation_select.dart';
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
        SizedBox(
            width: context.width,
            child: Image.asset(Assets.images.shop.homeShop1.path,
                fit: BoxFit.cover)),
        NavigationsWidget(
          true,
          () {
            Navigator.pop(context);
          },
          Navigations.back,
          "null",
          Align(alignment: Alignment.topCenter, child: dropDownCity(context)),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Haircut for Men",
              style: TextConstants.instance.heading3
                  .copyWith(color: ColorConstant.instance.light4),
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
            const FilterList(),
            Text("102 shops giving Haircut service",
                style: TextConstants.instance.label1),
            GestureDetector(
                onTap: () {
                  NavigationService.instance
                      .navigateToPage(Routes.shopDetail.name);
                },
                child: ShopList(
                    cardHeight: 300,
                    cardWidth: context.dynamicWidth(0.3),
                    isHorizontal: false,
                    listHeight: 500)),
          ],
        ),
      ),
    );
  }

  Widget dropDownCity(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          CustomIcon(
              imagePath: Assets.icons.location.path,
              iconColor: ColorConstant.instance.light4),
          // DropdownButton<String>(
          //   value: provider.dropdownValue,
          //   icon: const Icon(Icons.keyboard_arrow_down_outlined),
          //   elevation: 16,
          //   style: TextConstants.instance.button1
          //       .copyWith(color: ColorConstant.instance.light4),
          //   underline: Container(height: 0),
          //   onChanged: (String? value) {
          //     provider.dropdownValue = value!;
          //   },
          //   items: provider.locationList
          //       .map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(
          //         value,
          //       ),
          //     );
          //   }).toList(),
          // ),
        ],
      ),
    );
  }
}
