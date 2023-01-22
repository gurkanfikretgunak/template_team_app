import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/keyboard_type.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidgets {
  Widget enterMobileNumberBody(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex:
                WidgetsBinding.instance.window.viewInsets.bottom > 0.0 ? 8 : 13,
            child: Wrap(
              runSpacing: 20,
              children: [
                Text(
                  L10n.of(context)!.enterMobileNumber,
                  style: TextConstants.instance.heading6,
                ),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.mobile_friendly_outlined),
                  labelTextValue: L10n.of(context)!.phoneNumber,
                  hintText: "(+1) - __ __",
                  keyboardType: KeyboardType.number,
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: context.dynamicWidth(1),
              child: CustomElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(Routes.verifyOtb.name);
                },
                text: L10n.of(context)!.sendOtb,
                textColor: ButtonColor.light,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
