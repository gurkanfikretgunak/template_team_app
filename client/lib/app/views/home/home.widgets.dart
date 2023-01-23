import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/home/widgets/filter_list.dart';
import 'package:client/app/views/home/see_all_near/see_all.view.dart';
import 'package:client/app/views/home/widgets/location_alert_dialog.dart';
import 'package:client/app/views/home/widgets/services_gridview.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/buttons/buttons_widgets.dart';
import '../../widgets/image_viewer/icons/icons_widgets.dart';
import '../search/widgets/search_bar.widget.dart';

class HomeWidgets {
  CustomAppbar appbar(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);

    return CustomAppbar(
      leading: Row(children: [
        Padding(
          padding: context.verticalPaddingLow,
          child: InkWell(
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => const LocationAlertDialog(),
              );
            },
            child: Padding(
              padding: context.verticalPaddingNormal,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.start,
                spacing: 10,
                children: [
                  CustomIcon(imagePath: Assets.icons.location.path),
                  Text(
                    provider.ddLocationValue,
                    style: TextConstants.instance.button1,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: ColorConstant.instance.dark0,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  body(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            CustomSearchField(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchBarWidget()));
            }),
            const FilterList(),
            categoryTitle(
              title: L10n.of(context)!.beautyServices,
              context: context,
              seeAllOnPressed: () {
                NavigationService.instance
                    .navigateToPage(Routes.beautyServiceDetail.name);
              },
            ),
            const ServicesGridView(),
            categoryTitle(
                title: L10n.of(context)!.popularNearYou, context: context),
            ShopList(
              imageFlex: 2,
              isHorizontal: true,
              cardHeight: context.dynamicHeight(0.3),
              cardWidth: context.dynamicHeight(0.3),
              listHeight: context.dynamicHeight(0.25),
              imageWidth: 180,
            ),
          ],
        ),
      ),
    );
  }
}

class ShopList extends StatelessWidget {
  const ShopList({
    Key? key,
    required this.isHorizontal,
    required this.cardHeight,
    required this.cardWidth,
    required this.listHeight,
    required this.imageFlex,
    required this.imageWidth,
  }) : super(key: key);
  final bool isHorizontal;
  final double cardHeight;
  final double cardWidth;
  final double listHeight;
  final int imageFlex;
  final double imageWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        itemBuilder: (context, index) {
          return ShopCard(
            isBig: false,
            imageFlex: imageFlex,
            shopModel: MockShop.bookingList[index],
            cardHeight: cardHeight,
            cardWidth: cardWidth,
            imageWidth: imageWidth,
          );
        },
      ),
    );
  }

  buildShopCardImage(String location) {
    switch (location) {
      case 'Munich Center':
        return Assets.images.shop.shop1.path;
      case 'Moosach':
        return Assets.images.shop.shop2.path;
      case 'Pasing-Obermenzing':
        return Assets.images.shop.shop3.path;
      case 'Trudering/Riem':
        return Assets.images.shop.shop4.path;
      default:
        return Assets.images.shop.shop4.path;
    }
  }
}

Widget categoryTitle({
  required String title,
  required BuildContext context,
  VoidCallback? seeAllOnPressed,
}) {
  return Padding(
    padding: context.verticalPaddingNormal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextConstants.instance.heading6,
        ),
        CustomTextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SeeAllNearView()));
          },
          text: L10n.of(context)!.seeAll,
        )
      ],
    ),
  );
}
