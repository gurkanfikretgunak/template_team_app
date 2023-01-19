import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class AlertBottomSheet extends StatelessWidget {
  const AlertBottomSheet({
    super.key,
    required this.title,
    required this.subTitle,
    required this.redButtonText,
  });
  final String title;
  final String subTitle;
  final String redButtonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextConstants.instance.heading6
              .copyWith(fontWeight: FontWeight.w500),
        ),
        context.emptySizedHeightBoxLow,
        Text(
          subTitle,
          style: TextConstants.instance.subtitle1
              .copyWith(color: ColorConstant.instance.dark3),
        ),
        context.emptySizedHeightBoxNormal,
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomOutlinedButton(
                onPressed: () {},
                text: L10n.of(context)!.cancel,
                buttonSize: ButtonSize.large,
              ),
            ),
            context.emptySizedWidthBoxNormal,
            Expanded(
              flex: 3,
              child: CustomElevatedButton(
                onPressed: () {},
                text: redButtonText,
                buttonColor: ButtonColor.red,
                textColor: ButtonColor.light,
                buttonSize: ButtonSize.large,
              ),
            )
          ],
        )
      ],
    );
  }
}
