import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/icon_size.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search_field_notification.dart';

class CustomSearchField extends BaseView {
  const CustomSearchField({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchFieldNotifier>(context);
    return CustomTextFormField(
      //IconButton içinde kullanmayınca boyutlandırma sorunu yaşıyorum.
      hintText: "Search",
      onChanged: (value) {
        value.isNotEmpty ? provider.active = true : provider.active = false;
      },
      controller: provider.searchController,
      prefixIcon: IconButton(
        onPressed: null,
        icon: CustomIcon(
          imagePath: "assets/icons/search.png",
          iconColor: ColorConstant.instance.purple2,
          height: IconSize.medium,
          width: IconSize.medium,
        ),
      ),
      suffixIcon: provider.active
          ? IconButton(
              onPressed: () {
                provider.searchController.clear();
              },
              icon: CustomIcon(
                imagePath: "assets/icons/close.png",
                iconColor: ColorConstant.instance.purple2,
                height: IconSize.medium,
                width: IconSize.medium,
              ),
            )
          : const SizedBox(),
    );
  }
}
