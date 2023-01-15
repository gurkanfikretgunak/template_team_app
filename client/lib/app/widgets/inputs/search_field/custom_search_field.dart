import 'package:client/app/widgets/icons/custom_max_icons.dart';
import 'package:client/app/widgets/inputs/text_fields/custom_text_form_field.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends BaseView {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        prefixIcon: CustomMaxIcon(
          imagePath: "assets/icons/search.png",
          iconColor: ColorConstant.instance.purple2,
        ),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: CustomMaxIcon(
            imagePath: "assets/icons/close.png",
            iconColor: ColorConstant.instance.purple2,
          ),
        ));
  }
}
