import 'package:client/app/widgets/image_viewer/icons/widgets/custom_icons.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class OffersButton extends BaseView {
  const OffersButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: context.dynamicHeight(0.04),
        decoration: BoxDecoration(
          color: ColorConstant.instance.light2,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Padding(
          padding: context.horizontalPaddingNormal,
          child: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                const CustomIcon(imagePath: 'assets/icons/offer.png'),
                Text("Offers", style: TextConstants.instance.subtitle1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
