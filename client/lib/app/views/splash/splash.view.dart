import 'package:client/app/views/splash/splash.widgets.dart';
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
        children: [
          const Text('not errror'),
          const CustomTextFormField(
            labelTextValue: "xlkv",
            labelTextRequired: LabelText.required,
            focusedBorderColor: TextFormFieldColor.purple,
            enabledBorderColor: TextFormFieldColor.green,
          ),
          const CustomSearchField(),
          const CustomDivider(type: DividerType.dashed),
          // CustomTabBar(
          //   tabBarList: tabbarList,
          //   tabBarViewList: tabbarViewList,
          // ),

          CustomRadioButton(
            list: list2,
          )
        ],
      ),
      errorBody: const Text('errorrrr'),
    );
  }
}
