import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/buttons/widgets/chip_button.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class OfferButton extends BaseView {
  const OfferButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChipButton(
      onTap: () {
        // showDialog<String>(
        //   context: context,
        //   builder: (BuildContext context) => const LocationAlertDialog(),
        // );
      },
      widget: FittedBox(
        child: Wrap(
          spacing: 10,
          children: [
            CustomIcon(
              imagePath: Assets.images.shop.offer.path,
            ),
            Text(L10n.of(context)!.offer,
                style: TextConstants.instance.subtitle2)
          ],
        ),
      ),
    );
  }
}
