import 'package:client/app/views/home/widgets/services_gridview.dart';
import 'package:client/app/widgets/buttons/widgets/offers_button.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/buttons_widgets.dart';
import '../../widgets/image_viewer/icons/icons_widgets.dart';

class HomeWidgets {
  appBar() {
    return CustomAppbar(
      leading: Wrap(
        spacing: 10,
        children: [
          const CustomIcon(imagePath: 'assets/icons/location.png'),
          Text("Munich Center", style: TextConstants.instance.button1),
        ],
      ),
    );
  }

  body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            const CustomSearchField(),
            const FilterList(),
            categoryTitle(title: "Beauty services"),
            const ServicesGridView(),
            categoryTitle(title: "Best Offers"),
            const SalonList()
          ],
        ),
      ),
    );
  }
}

class SalonList extends StatelessWidget {
  const SalonList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.25),
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FittedBox(
            child: ShopCard(),
          );
        },
      ),
    );
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
        CustomDropdownButton(list: genderList, hintText: DDHintText.gender),
        CustomDropdownButton(list: genderList, hintText: DDHintText.price),
        const OffersButton(),
      ],
    );
  }
}

Row categoryTitle({required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Beauty services",
        style: TextConstants.instance.heading6,
      ),
      CustomTextButton(
        onPressed: () {},
        text: " see all >",
      )
    ],
  );
}
