import 'package:client/app/views/splash/splash.widgets.dart';
import 'package:client/app/widgets/inputs/search_field/custom_search_field.dart';
import 'package:client/app/widgets/inputs/text_fields/custom_text_form_field.dart';
import 'package:client/app/widgets/inputs/text_fields/widgets/help_text.dart';
import 'package:client/app/widgets/inputs/text_fields/widgets/label_text.dart';
import 'package:client/app/widgets/inputs/text_fields/widgets/textformfield_color.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class SplashView extends BaseView with SplashWidgets {
  const SplashView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: backendError(),
      body: Column(
        children: const [
          Text('not errror'),
          CustomTextFormField(
            // helpTextLabel: HelpText.on,
            // helpTextLabelValue: "Deneme",
            labelTextValue: "xlkv",
            labelTextRequired: LabelText.required,
            focusedBorderColor: TextFormFieldColor.purple,
            enabledBorderColor: TextFormFieldColor.green,
            // suffixIcon: "assets/icons/check.png",
            // prefixIcon: "assets/icons/check.png",
            // suffixIconColor: TextFormFieldColor.green,
          ),
          CustomSearchField(),
        ],
      ),
      errorBody: const Text('errorrrr'),
    );
  }
}
