import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends BaseView with PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    this.title,
    this.leading,
    this.specialAppbar,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final Widget? specialAppbar;
  @override
  Widget build(BuildContext context) {
    return dynamicBuild(
      context,
      error: HasError.off,
      body: (specialAppbar != null)
          ? Container(child: specialAppbar!)
          : Row(
              children: [
                Center(
                    child: Padding(
                  padding: context.horizontalPaddingNormal,
                  child: leading,
                )),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      title ?? "",
                      style: TextConstants.instance.heading6,
                    ),
                  ],
                ),
              ],
            ),
      errorBody: const Text(""),
    );
  }

  @override
  Size get preferredSize => specialAppbar == null
      ? const Size.fromHeight(60.0)
      : const Size.fromHeight(90.0);
}
