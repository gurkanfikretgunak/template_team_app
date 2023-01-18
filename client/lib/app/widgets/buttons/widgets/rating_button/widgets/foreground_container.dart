import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/shadow_effect_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ForegroundContainer extends StatelessWidget {
  const ForegroundContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 7,
      child: Container(
        height: context.dynamicHeight(0.035),
        decoration: BoxDecoration(
          boxShadow: ShadowEffectConstants.instance.elevationInset,
          color: ColorConstant.instance.light4,
          border: Border.all(color: ColorConstant.instance.dark4),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 6,
          children: [
            CustomIcon(
              imagePath: Assets.icons.arrowUpArrowDown.path,
              height: IconSize.medium,
            ),
            const Text("Rating"),
            CustomIcon(
              imagePath: Assets.icons.arrowUp.path,
              height: IconSize.medium,
            ),
          ],
        ),
      ),
    );
  }
}
