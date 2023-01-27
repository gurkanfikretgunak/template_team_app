import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    this.title,
    this.leading,
    this.specialAppbar,
    this.titleWidget,
  }) : super(key: key);

  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final Widget? specialAppbar;
  @override
  Widget build(BuildContext context) {
    return (specialAppbar != null)
        ? specialAppbar!
        : SizedBox(
            height: specialAppbar == null
                ? context.dynamicHeight(0.25)
                : context.dynamicHeight(0.2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  leading == null
                      ? IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorConstant.instance.dark1,
                          ),
                        )
                      : Padding(
                          padding: context.horizontalPaddingNormal,
                          child: leading,
                        ),
                  titleWidget ??
                      Text(
                        title ?? '',
                        style: TextConstants.instance.heading6,
                        maxLines: 1,
                      ),
                ],
              ),
            ),
          );
  }

  @override
  Size get preferredSize => specialAppbar == null
      ? const Size.fromHeight(60.0)
      : const Size.fromHeight(90.0);
}
