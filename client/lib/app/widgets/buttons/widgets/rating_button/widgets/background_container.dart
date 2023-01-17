import 'package:client/app/widgets/custom_card.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Container(
        height: context.dynamicHeight(0.04),
        width: context.dynamicWidth(0.24),
        decoration: BoxDecoration(
          color: ColorConstant.instance.light2,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
