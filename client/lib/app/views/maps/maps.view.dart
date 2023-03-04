import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/maps/widgets/current_location.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:provider/provider.dart';
import '../../routes/navigation_service.dart';
import '../../routes/routes.dart';
import 'maps.viewmodel.dart';

class MapsView extends BaseView {
  const MapsView(this.error, {super.key});

  final bool error;

  HasError backendError() {
    return error ? HasError.on : HasError.off;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MapsViewModel>(context);

    return dynamicBuild(
      context,
      error: backendError(),
      appbar: AppBar(
        title: const Text("Google Maps"),
        actions: [
          provider.shoulShowInput
              ? CustomTextButton(
                  onPressed: () {
                    NavigationService.instance
                        .navigateToPageClear(path: Routes.navigation.name);
                  },
                  text: L10n.of(context)!.continueShop,
                  color: ButtonColor.light)
              : const SizedBox()
        ],
        centerTitle: true,
        backgroundColor: ColorConstant.instance.purple2,
      ),
      body: const MapsViewWidget(),
      errorBody: const Text('errorrrr'),
    );
  }
}
