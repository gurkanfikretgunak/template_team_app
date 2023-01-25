import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.child,
    this.height,
    this.title,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
      content: SizedBox(
        height: height,
        width: context.dynamicWidth(1),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: _buildCloseIconButton(context),
            ),
            Text(
              title ?? '',
              style: TextConstants.instance.heading6
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: context.dynamicHeight(0.06)),
            child,
          ],
        ),
      ),
    );
  }

  Align _buildCloseIconButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
        iconSize: 25,
      ),
    );
  }
}
