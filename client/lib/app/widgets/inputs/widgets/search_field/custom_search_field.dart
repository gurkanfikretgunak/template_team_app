import 'package:client/app/views/search/widgets/search_bar.widget.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_field_notification.dart';

class CustomSearchField extends BaseView {
  const CustomSearchField(this.onTap, {super.key});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchFieldNotifier>(context);
    return CustomTextFormField(
      onTap: onTap,
      hintText: "Search",
      onChanged: (value) {
        value.isNotEmpty ? provider.active = true : provider.active = false;
      },
      controller: provider.searchController,
      prefixIcon: IconButton(
        onPressed: null,
        icon: CustomIcon(
          imagePath: Assets.icons.search.path,
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
                imagePath: Assets.icons.close.path,
                iconColor: ColorConstant.instance.purple2,
                height: IconSize.medium,
                width: IconSize.medium,
              ),
            )
          : const SizedBox(),
    );
  }
}
