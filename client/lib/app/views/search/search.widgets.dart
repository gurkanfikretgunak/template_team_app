import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/home/widgets/services_gridview.dart';
import 'package:client/app/views/search/search_bar/search_bar.widget.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routes/navigation_service.dart';
import '../../routes/routes.dart';
import '../../widgets/buttons/buttons_widgets.dart';
import '../../widgets/inputs/widgets/search_field/search_field_notification.dart';

class SearchWidgets {
  searchBody(BuildContext context) {
    final provider = Provider.of<SearchFieldNotifier>(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: context.paddingNormal,
        child: Wrap(
          children: [
            CustomSearchField(() {}),
            categoryTitle(
              title: L10n.of(context)!.recentlySearched,
              context: context,
              buttonText: L10n.of(context)!.clearAll,
              onPressed: () {
                provider.searchClear();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: provider.deneme.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Image.asset(
                        Assets.icons.search.path,
                        color: ColorConstant.instance.dark3,
                      ),
                      context.emptySizedWidthBoxNormal,
                      Text(provider.deneme[index],
                          style: TextConstants.instance.button1
                              .copyWith(color: ColorConstant.instance.dark3))
                    ],
                  );
                }),
            const CustomDivider(type: DividerType.normal),
            categoryTitle(
                title: L10n.of(context)!.trendingNearYou,
                context: context,
                buttonText: ""),
            GestureDetector(
              onTap: () {
                NavigationService.instance
                    .navigateToPage(Routes.shopDetail.name);
              },
              child: ShopList(
                imageFlex: 2,
                isHorizontal: true,
                cardHeight: context.dynamicHeight(0.3),
                cardWidth: context.dynamicHeight(0.3),
                listHeight: context.dynamicHeight(0.25),
              ),
            ),
            const CustomDivider(type: DividerType.normal),
            categoryTitle(
                title: L10n.of(context)!.tryTheseService,
                context: context,
                buttonText: ""),
            const ServicesGridView(),
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
  }) : super(key: key);
  final bool isHorizontal;
  final double cardHeight;
  final double cardWidth;
  final double listHeight;
  final int imageFlex;
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
            shopModel: ShopDetailData(
              shop: Shop(
                address: Address(),
                name: "name",
                phoneNumber: "1111111",
                averageRating: 2,
                genderPreference: "",
                numRates: 2,
                sId: "--",
                serviceTypes: [],
              ),
            ),
            imageFlex: imageFlex,
            cardHeight: cardHeight,
            cardWidth: cardWidth,
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

Widget categoryTitle(
    {required String title,
    String? buttonText,
    required BuildContext context,
    VoidCallback? onPressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextConstants.instance.heading6,
      ),
      CustomTextButton(
        onPressed: onPressed,
        text: buttonText ?? " see all >",
      )
    ],
  );
}
