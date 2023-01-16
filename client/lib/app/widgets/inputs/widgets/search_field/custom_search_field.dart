import 'package:client/app/widgets/icons/icons_widgets.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends BaseView {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        prefixIcon: CustomIcon(
          imagePath: "assets/icons/search.png",
          iconColor: ColorConstant.instance.purple2,
        ),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: CustomIcon(
            imagePath: "assets/icons/close.png",
            iconColor: ColorConstant.instance.purple2,
          ),
        ));
  }
}
