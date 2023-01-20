import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/constans/text_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/image_viewer/icons/widgets/custom_icons.dart';

class OfferBoxWidget extends StatelessWidget {
  const OfferBoxWidget({
    super.key,
  });

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIcon(imagePath: Assets.icons.offer.path),
                  Text(
                    "50% off",
                    style: TextConstants.instance.button1,
                  )
                ],
              ),
              Text(
                "use code FREE50",
                style: TextConstants.instance.label2,
              )
            ],
          ),
        ),
      ],
    );
  }
}
