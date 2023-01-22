import 'package:client/app/widgets/buttons/widgets/chip_button.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CategoriesButton extends BaseView {
  const CategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listItems = ["Recommended", "Packages", "Face Care"];
    return SizedBox(
      height: context.dynamicHeight(0.0),
      child: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ChipButton(
            onTap: () {},
            widget: Wrap(
              spacing: 10,
              children: [
                CustomIcon(imagePath: Assets.icons.offer.path),
                Text(listItems[index]),
              ],
            ),
            height: context.dynamicHeight(0.0),
          );
        },
      ),
    );
  }
}
