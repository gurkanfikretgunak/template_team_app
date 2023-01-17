import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/shadow_effect_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class ForegroundContainer extends StatelessWidget {
  const ForegroundContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      child: Container(
        height: context.dynamicHeight(0.045),
        decoration: BoxDecoration(
          boxShadow: ShadowEffectConstants.instance.elevationInset,
          color: ColorConstant.instance.light4,
          border: Border.all(color: ColorConstant.instance.dark4),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            children: const [
              CustomIcon(
                imagePath: 'assets/icons/arrow_up_arrow_down.png',
                height: IconSize.large,
              ),
              Text("Rating"),
              CustomIcon(
                imagePath: 'assets/icons/arrow_up.png',
                height: IconSize.medium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
