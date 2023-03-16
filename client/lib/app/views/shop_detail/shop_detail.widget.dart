import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/views/shop_detail/shop_detail.viewmodel.dart';
import 'package:client/app/views/shop_detail/widget/offer_box.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/face_care.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/haircut.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/packages.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/recommended/recommended.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constans/text_constants.dart';

class ShopDetailWidgets {
  Widget shopDetailBody(BuildContext context, ShopDetailData shopModel) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildIcons(context, shopModel),
            context.emptySizedHeightBoxLow,
            const CustomDivider(type: DividerType.dashed),
            context.emptySizedHeightBoxLow,

            SizedBox(
              height: context.dynamicHeight(0.06),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: shopModel.coupons!.length,
                itemBuilder: (context, index) {
                  Coupons coupons = shopModel.coupons![index];
                  return FittedBox(
                    child: OfferBoxWidget(
                      couponDesc: coupons.couponDesc ?? "",
                      couponName: coupons.couponName ?? '',
                      discount: coupons.discount.toString(),
                    ),
                  );
                },
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [

            //     shopModel.
            //     const OfferBoxWidget(),
            //     context.emptySizedWidthBoxLow,
            //     const OfferBoxWidget(),
            //   ],
            // ),
            const Divider(thickness: 5.0),
            buildTabbar(context),
          ],
        ),
      ),
    );
  }

  Widget buildIcons(BuildContext context, ShopDetailData shopModel) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          communicationIcons(context),
          context.emptySizedWidthBoxHigh,
          favoriteIcon(shopModel),
          ratingIcon(context)
        ],
      ),
    );
  }

  Widget ratingIcon(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 4,
      children: [
        Padding(
          padding: context.onlyTopPaddingNormal,
          child: SizedBox(
            height: context.dynamicHeight(0.045),
            child: CustomOutlinedButton(
              borderSideColor: ButtonColor.blue,
              onPressed: () {},
              buttonSize: ButtonSize.small,
              child: Wrap(spacing: 5, children: [
                Icon(
                  Icons.star,
                  color: ColorConstant.instance.yellow1,
                  size: 16,
                ),
                Text(
                  "4.1",
                  style: TextConstants.instance.button1.copyWith(
                    color: ColorConstant.instance.blue0,
                  ),
                )
              ]),
            ),
          ),
        ),
        Column(
          children: [
            Text(
              "5k+ ",
              style: TextConstants.instance.paragraph2.copyWith(
                color: ColorConstant.instance.blue0,
              ),
            ),
            Text(
              " ${L10n.of(context)!.ratings}",
              style: TextConstants.instance.subtitle2.copyWith(
                color: ColorConstant.instance.blue0,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget favoriteIcon(ShopDetailData shopModel) {
    return Consumer<ShopDetailViewModel>(
      builder: (context, value, child) {
        bool favoriteShopDetail = value.isDetailFavorite(shopModel);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  value.favShopDetail(shopModel, !favoriteShopDetail);
                  print(BookingViewModel().isFavorite(shopModel));
                },
                icon: AnimatedCrossFade(
                  firstChild: Icon(
                    Icons.favorite,
                    color: ColorConstant.instance.purple2,
                    size: 30,
                  ),
                  secondChild: const Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                  crossFadeState: favoriteShopDetail
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(seconds: 1),
                )),
            context.emptySizedHeightBoxLow,
            context.emptySizedHeightBoxLow,
          ],
        );
      },
    );
  }

  Widget communicationIcons(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return context.emptySizedWidthBoxLow;
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: ShopDetailViewModel().accountItems(context).length,
        itemBuilder: (context, index) {
          var key = ShopDetailViewModel().accountItems(context)[index];
          return InkWell(
            child: FittedBox(
              child: Column(
                children: [
                  IconButton(
                      onPressed: key['onTap'],
                      icon: Icon(
                        key['icon'],
                        size: 22,
                      )),
                  Text(
                    key['text'],
                    style: TextConstants.instance.paragraph2,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTabbarView(BuildContext context,
      {required ShopDetailData shopDetailData}) {
    final provider = Provider.of<ShopDetailViewModel>(context);

    switch (provider.selectedTab) {
      case "Recommended":
        return RecommendedView(recommended: shopDetailData.recommends!);
      case "Packages":
        return PackagesView(
          packages: shopDetailData.packages!,
        );
      case "Face Care":
        return const FaceCareView();
      case "Haircut":
        return const HairCutView();
      case 'Önerilen':
        return RecommendedView(recommended: shopDetailData.recommends!);
      case 'Paketler':
        return PackagesView(
          packages: shopDetailData.packages!,
        );
      case 'Yüz bakımı':
        return const FaceCareView();
      case 'Saç kesimi':
        return const HairCutView();

      default:
        return const SizedBox();
    }
  }

  Widget buildTabbar(BuildContext context) {
    final provider = Provider.of<ShopDetailViewModel>(context);

    List<String> list = [
      L10n.of(context)!.recommended,
      L10n.of(context)!.packages,
      L10n.of(context)!.faceCare,
      L10n.of(context)!.haircut
    ];

    return SizedBox(
      height: context.dynamicHeight(0.06),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  provider.selectedTab = list[index];
                },
                child: Chip(
                  backgroundColor: ColorConstant.instance.light2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  label: Text(
                    list[index],
                    style: TextStyle(
                      color: provider.selectedTab == list[index]
                          ? ColorConstant.instance.purple2
                          : ColorConstant.instance.dark3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              context.emptySizedWidthBoxNormal,
            ],
          );
        },
      ),
    );
  }
}
