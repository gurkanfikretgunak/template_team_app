import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/custom_outlined_button.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constans/text_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../../../l10n/app_l10n.dart';
import '../../../widgets/image_viewer/icons/widgets/custom_icons.dart';

class OfferBoxWidget extends StatelessWidget {
  const OfferBoxWidget({
    super.key,
    required this.couponName,
    required this.couponDesc,
    required this.discount,
  });

  final String couponName;
  final String couponDesc;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOutlinedButton(
          borderSideColor: ButtonColor.dark,
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(
                    imagePath: Assets.images.shop.offer.path,
                  ),
                  context.emptySizedWidthBoxLow,
                  Text(
                    discount,
                    style: TextConstants.instance.button1,
                  )
                ],
              ),
              Text(
                couponName,
                style: TextConstants.instance.label2,
              )
            ],
          ),
        ),
      ],
    );
  }
}
