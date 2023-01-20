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
            child: Row(
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
                        child: Center(child: leading),
                      ),
                titleWidget ??
                    Text(
                      title ?? '',
                      style: TextConstants.instance.heading6,
                      maxLines: 1,
                    ),
              ],
            ),
          );
    // AppBar(
    //   leading: leading == null
    //       ? IconButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           icon: const Icon(
    //             Icons.arrow_back,
    //           ),
    //         )
    //       : Padding(
    //           padding: context.horizontalPaddingNormal,
    //           child: Center(child: leading),
    //         ),
    //   leadingWidth: leading == null
    //       ? context.dynamicWidth(0.12)
    //       : context.dynamicWidth(1),
    //   automaticallyImplyLeading: false,
    //   title: titleWidget ??
    //       Text(
    //         title ?? '',
    //         style: TextConstants.instance.heading6,
    //         maxLines: 1,
    //       ),
    // );
  }

  @override
  Size get preferredSize => specialAppbar == null
      ? const Size.fromHeight(60.0)
      : const Size.fromHeight(90.0);
}
