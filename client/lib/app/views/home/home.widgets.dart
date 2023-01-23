import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/home/widgets/offer_button.dart';
import 'package:client/app/views/home/widgets/rating_button.dart';
import 'package:client/app/views/home/widgets/services_gridview.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:faker/faker.dart';
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
            onTap: () => _showAlertDialog(context),
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
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  _showAlertDialog(BuildContext context) {
    showGeneralDialog(
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: const _AlertDialogWidget(),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
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
                title: L10n.of(context)!.beautyServices, context: context),
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

class _AlertDialogWidget extends StatelessWidget {
  const _AlertDialogWidget();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      content: SizedBox(
        width: context.dynamicWidth(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  underline: const SizedBox(),
                  value: provider.ddLocationValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: provider.locationList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    provider.ddLocationValue = newValue!;
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ],
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
    final provider = Provider.of<HomeViewModel>(context);

    var fake = Faker();
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
            address: fake.address.city(),
            distance: fake.randomGenerator.integer(20).toDouble(),
            genderType: fake.person.random.string(20),
            hasDiscount: fake.randomGenerator.boolean(),
            imagePath: buildShopCardImage(provider.ddLocationValue),
            rating: fake.randomGenerator.integer(20).toDouble(),
            shopName: fake.company.name(),
            shopTypes: fake.company.name(),
            discountAmount: fake.randomGenerator.integer(20).toDouble(),
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

class FilterList extends StatelessWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> genderList = ["Women", "Man"];
    List<String> priceList = ["a", "b"];
    final provider = Provider.of<HomeViewModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomDropdownButton(
            value: provider.ddGenderValue,
            onChanged: (String? value) {
              provider.setDropDownGenderValue(value!);
              provider.ddGenderValue = value;
            },
            list: genderList,
            hintText: DDHintText.gender,
          ),
        ),
        context.emptySizedWidthBoxLow,
        Expanded(
          child: CustomDropdownButton<String>(
            value: provider.ddPriceValue,
            onChanged: (String? value) {
              provider.setDropDownPriceValue(value!);
              provider.ddPriceValue = value;
            },
            list: priceList,
            hintText: DDHintText.price,
          ),
        ),
        context.emptySizedWidthBoxLow,
        const Expanded(child: OfferButton()),
        context.emptySizedWidthBoxLow,
        const Expanded(child: RatingButton()),
      ],
    );
  }
}

Widget categoryTitle({required String title, required BuildContext context}) {
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
          onPressed: () {},
          text: L10n.of(context)!.seeAll,
        )
      ],
    ),
  );
}
