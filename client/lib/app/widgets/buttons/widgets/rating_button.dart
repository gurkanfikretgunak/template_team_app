import 'package:client/app/widgets/custom_card.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/custom_icons.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class RatingButton extends BaseView {
  const RatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return InkWell(
    //   onTap: () {},
    //   child: Stack(
    //     children: [
    //       Container(
    //         width: context.dynamicWidth(0.2),
    //         height: context.dynamicHeight(0.035),
    //         decoration: BoxDecoration(
    //           color: ColorConstant.instance.light2,
    //           borderRadius: const BorderRadius.all(Radius.circular(25)),
    //         ),
    //       ),
    //       Positioned(
    //         left: 20,
    //         child: CustomCard(
    //           width: context.dynamicWidth(0.2),
    //           height: context.dynamicHeight(0.045),
    //           color: ColorConstant.instance.light4,
    //           borderRadius: const BorderRadius.all(Radius.circular(25)),
    //           shadowColor: ColorConstant.instance.dark4,
    //           elevation: 10,
    //           child: Text("kj"),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
