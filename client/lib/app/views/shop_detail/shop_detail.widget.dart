import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/shop_detail/shop_detail.viewmodel.dart';
import 'package:client/app/views/shop_detail/widget/offer_box.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/face_care.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/packages.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/recommended.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constans/text_constants.dart';
import '../../widgets/image_viewer/icons/icons_widgets.dart';

class ShopDetailWidgets {
  Widget shopDetailBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: communicationIcons(context),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomOutlinedButton(
                        borderSideColor: ButtonColor.dark,
                        onPressed: () {},
                        buttonSize: ButtonSize.small,
                        child: Row(children: const [
                          Icon(Icons.star_border_outlined),
                          Text("4.1")
                        ]),
                      ),
                      Text(
                        "5k + ratings",
                        style: TextConstants.instance.label2
                            .copyWith(color: ColorConstant.instance.blue2),
                      )
                    ],
                  ),
                )
              ],
            ),
            context.emptySizedHeightBoxLow,
            const CustomDivider(type: DividerType.dashed),
            context.emptySizedHeightBoxLow,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const OfferBoxWidget(),
                context.emptySizedWidthBoxLow,
                const OfferBoxWidget(),
              ],
            ),
            const Divider(thickness: 5.0),
            buildTabbar(context),
          ],
        ),
      ),
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
            child: Column(
              children: [
                IconButton(
                  onPressed: key['onTap'],
                  icon: CustomIcon(
                    imagePath: key['icon'],
                  ),
                ),
                Text(key['text'])
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildTabbarView(BuildContext context) {
    final provider = Provider.of<ShopDetailViewModel>(context);

    switch (provider.selectedTab) {
      case "Recommended":
        return const RecommendedView();
      case "Packages":
        return const PackagesView();
      case "Face Care":
        return const FaceCareView();
      default:
        return const SizedBox();
    }
  }

  // ignore: non_constant_identifier_names
  Widget buildTabbar(BuildContext context) {
    final provider = Provider.of<ShopDetailViewModel>(context);

    List<String> list = ["Recommended", "Packages", "Face Care", "Packages"];

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
