import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/app/widgets/system_ui_overlay/navigation/custom_navigation.dart';
import 'package:client/app/widgets/system_ui_overlay/navigation/navigation_select.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class ReguireMobileWidgets {
  Widget requireMobileTextField(BuildContext context) {
    return Padding(
      padding: context.onlyLRTBpaddingNormal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationsWidget(false, () {}, Navigations.exit, "Enter mobile number"),
              const CustomTextFormField(
                  prefixIcon: Icon(Icons.mobile_friendly_outlined),
                  labelTextValue: "Phone Number",
                  hintText: "(+1) - __ __"),
            ],
          ),
          CustomElevatedButton(
              onPressed: () {}, text: "Login", buttonSize: ButtonSize.large, buttonColor: ButtonColor.purple),
        ],
      ),
    );
  }
}
