import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helpTextLabel: HelpText.on,
      helpTextLabelValue: 'HelpText',
      prefixIcon: Icon(
        Icons.search,
        color: ColorConstant.instance.purple2,
      ),
      hintText: "Search",
      suffixIcon: const Icon(Icons.close),
    );
  }
}
