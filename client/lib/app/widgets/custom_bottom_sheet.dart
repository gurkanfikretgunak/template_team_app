import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  static buildCustomBottomSheet({
    required BuildContext context,
    required Widget widget,
  }) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: context.paddingNormal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: context.dynamicHeight(0.02)),
                Container(
                  height: context.dynamicHeight(0.003),
                  width: context.dynamicWidth(0.2),
                  decoration: BoxDecoration(
                    color: ColorConstant.instance.dark3,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                      color: ColorConstant.instance.dark2),
                ),
                widget,
                context.emptySizedHeightBoxNormal
              ],
            ),
          );
        });
  }
}
