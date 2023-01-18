import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/home/widgets/rating_button.dart';
import 'package:client/app/views/home/widgets/services_gridview.dart';
import 'package:client/app/views/home/widgets/offer_button.dart';
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

class HomeWidgets {
  CustomAppbar appbar(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);

    return CustomAppbar(
      leading: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          CustomIcon(imagePath: Assets.icons.location.path),
          DropdownButton<String>(
            value: provider.dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            elevation: 16,
            style: TextConstants.instance.button1,
            underline: Container(height: 0),
            onChanged: (String? value) {
              provider.dropdownValue = value!;
            },
            items: provider.locationList
                .map<DropdownMenuItem<String>>((String value) {
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

  body(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            const CustomSearchField(),
            const FilterList(),
            categoryTitle(
                title: L10n.of(context)!.beautyServices, context: context),
            const ServicesGridView(),
            categoryTitle(
                title: L10n.of(context)!.popularNearYou, context: context),
            const ShopList(),
          ],
        ),
      ),
    );
  }
}

class ShopList extends StatelessWidget {
  const ShopList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);

    var fake = Faker();
    return SizedBox(
      height: context.dynamicHeight(0.25),
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ShopCard(
            address: fake.address.city(),
            distance: fake.randomGenerator.integer(20).toDouble(),
            genderType: fake.person.random.string(20),
            hasDiscount: fake.randomGenerator.boolean(),
            imagePath: buildShopCardImage(provider.dropdownValue),
            rating: fake.randomGenerator.integer(20).toDouble(),
            shopName: fake.company.name(),
            shopTypes: fake.company.name(),
            discountAmount: fake.randomGenerator.integer(20).toDouble(),
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
    }
  }
}

class FilterList extends StatelessWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> genderList = ["Women", "Man"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: CustomDropdownButton(
                list: genderList, hintText: DDHintText.gender)),
        context.emptySizedWidthBoxLow,
        Expanded(
            child: CustomDropdownButton(
                list: genderList, hintText: DDHintText.price)),
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
          text: " see all >",
        )
      ],
    ),
  );
}
