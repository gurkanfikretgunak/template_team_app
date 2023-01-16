import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    this.title,
    this.leading,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
            child: Padding(
          padding: context.horizontalPaddingNormal,
          child: leading,
        )),
        Text(
          title ?? "",
          style: TextConstants.instance.heading6,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
