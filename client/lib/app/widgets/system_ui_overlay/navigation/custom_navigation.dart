import 'package:client/app/widgets/system_ui_overlay/navigation/navigation_select.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

class NavigationsWidget extends BaseView {
  const NavigationsWidget(this.isVertical, this.buttonOnPressed, this.navigationName, this.headerName, this.widgetName,
      {super.key});

  final bool? isVertical;
  final VoidCallback buttonOnPressed;
  final Navigations? navigationName;
  final String headerName;
  final Widget? widgetName;

  @override
  Widget build(BuildContext context) {
    return isVertical!
        ? Row(
            children: [
              IconButton(
                onPressed: buttonOnPressed,
                icon: NavigationsLabel().navigations(navigationName),
              ),
              headerName == "null"
                  ? widgetName!
                  : Text(
                      headerName,
                      style: TextConstants.instance.heading6,
                    )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationsLabel().navigations(navigationName),
              Text(
                headerName,
                style: TextConstants.instance.heading5,
              )
            ],
          );
  }
}
