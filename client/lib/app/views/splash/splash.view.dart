import 'package:client/app/views/splash/splash.widgets.dart';
import 'package:client/app/widgets/custom_text.dart';
import 'package:client/app/widgets/divider/custom_divider.dart';
import 'package:client/app/widgets/tabbar/custom_tabbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

import '../../widgets/inputs/inputs_widgets.dart';

class SplashView extends BaseView with SplashWidgets {
  const SplashView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabbarList = [
      const CustomText("kdjf"),
      const CustomText("kdjf"),
    ];
    List<Widget> tabbarViewList = [
      const CustomText("kdjf"),
      const CustomText("kdjf"),
    ];

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
          const CustomCheckbox(),
          const CustomDivider(),
          CustomTabBar(
            tabBarList: tabbarList,
            tabBarViewList: tabbarViewList,
          )
        ],
      ),
      errorBody: const Text('errorrrr'),
    );
  }
}
