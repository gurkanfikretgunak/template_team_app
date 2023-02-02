import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/navigation_service.dart';
import 'package:client/app/routes/routes.dart';
import 'package:client/app/views/permission/permission.viewmodel.dart';
import 'package:client/app/views/permission/widgets/indicator_list.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PermissionPageWidget extends StatelessWidget {
  const PermissionPageWidget({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PermissionViewModel>(context);
    return SafeArea(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CustomTextButton(
                onPressed: () {
                  if (provider.currentIndex != 2) {
                    provider.pageController!.nextPage(
                      duration: context.durationLow,
                      curve: Curves.easeInOut,
                    );
                    provider.currentIndex = provider.currentIndex + 1;
                  } else {
                    NavigationService.instance
                        .navigateToPageClear(path: Routes.navigation.name);
                  }
                },
                text: L10n.of(context)!.later,
              ),
            ),
            Expanded(
              child: Padding(
                padding: context.paddingNormal,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: context.verticalPaddingNormal,
              child: const Align(
                  alignment: Alignment.center, child: IndicatorList()),
            ),
            Expanded(
                child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: context.verticalPaddingLow,
                          child: Text(
                            selectTitle(provider.currentIndex, context),
                            style: TextConstants.instance.heading4.copyWith(
                              color: ColorConstant.instance.purple2,
                            ),
                          ),
                        ),
                        Text(
                          selectText(provider.currentIndex, context),
                          style: TextConstants.instance.paragraph2
                              .copyWith(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {
                        provider.sendNotification(context);
                      },
                      text: !provider.isClicked
                          ? L10n.of(context)!.allowNotification
                          : L10n.of(context)!.goSettings,
                      textColor: ButtonColor.light,
                      buttonSize: ButtonSize.large,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  selectTitle(int pageIndex, BuildContext context) {
    switch (pageIndex) {
      case 0:
        return L10n.of(context)!.locationPermission;
      case 1:
        return L10n.of(context)!.cameraPermission;
      case 2:
        return L10n.of(context)!.notificationPermission;
    }
  }

  selectText(int pageIndex, BuildContext context) {
    switch (pageIndex) {
      case 0:
        return L10n.of(context)!.locationText;
      case 1:
        return L10n.of(context)!.cameraText;
      case 2:
        return L10n.of(context)!.notificationText;
    }
  }
}
