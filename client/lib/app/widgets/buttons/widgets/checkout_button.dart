import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final int? itemCount;
  final double? totalPrice;
  final VoidCallback? onPressed;
  const CheckoutButton({
    Key? key,
    this.itemCount,
    this.totalPrice,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: context.paddingNormal,
          child: SizedBox(
            width: context.dynamicWidth(1),
            child: CustomElevatedButton(
              buttonSize: ButtonSize.large,
              onPressed: onPressed,
              text: '',
              child: Padding(
                padding: context.horizontalPaddingNormal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                          width: context.dynamicWidth(0.1),
                          height: context.dynamicHeight(0.05),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: ColorConstant.instance.light1),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('$itemCount'),
                            ],
                          ),
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text('\$${totalPrice?.toStringAsFixed(2)}',
                                style: TextConstants.instance.button1.copyWith(color: ColorConstant.instance.light4)),
                            Text('plus taxes',
                                style:
                                    TextConstants.instance.paragraph2.copyWith(color: ColorConstant.instance.light4)),
                          ],
                        )
                      ],
                    ),
                    Text('Continue',
                        style: TextConstants.instance.button1.copyWith(color: ColorConstant.instance.light4)),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
