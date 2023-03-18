import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/home/widgets/filter_list.dart';
import 'package:client/app/views/home/widgets/drop_down/select_country_dropdown.dart';
import 'package:client/app/views/home/widgets/services_gridview.dart';
import 'package:client/app/views/shop/widget/list_shop.dart';
import 'package:client/app/views/shop_detail/bloc/shop_detail.bloc.dart';
import 'package:client/app/views/shop_detail/bloc/shop_detail.events.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/shop/shop_detail/shop_detail.model.dart';
import 'package:client/core/network/socket/socket_service.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/buttons/buttons_widgets.dart';
import '../../widgets/image_viewer/icons/icons_widgets.dart';

class HomeWidgets {
  CustomAppbar appbar(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    return CustomAppbar(
      leading:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: context.verticalPaddingLow,
          child: InkWell(
            onTap: () => _showAlertDialog(context),
            child: Padding(
              padding: context.verticalPaddingNormal,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.start,
                spacing: 10,
                children: [
                  CustomIcon(imagePath: Assets.icons.location.path),
                  Text(
                    provider.ddLocationValue == ""
                        ? "Ankara"
                        : provider.ddLocationValue,
                    style: TextConstants.instance.button1,
                  ),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            SocketService().socket.emit(
              'notification',
              {
                "message": "message",
                "sender": "",
                "receiver": "",
                "type": "",
              },
            );
          },
          icon: const Icon(Icons.notifications),
        )
      ]),
    );
  }

  _showAlertDialog(BuildContext context) {
    showGeneralDialog(
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: const _AlertDialogWidget(),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }

  body(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            CustomSearchField(() {}),
            const FilterList(),
            categoryTitle(
              title: L10n.of(context)!.beautyServices,
              context: context,
              seeAllOnPressed: () {
                NavigationService.instance
                    .navigateToPage(Routes.beautyServiceDetail.name);
              },
            ),
            const ServicesGridView(),
            categoryTitle(
              title: L10n.of(context)!.popularNearYou,
              context: context,
              seeAllOnPressed: () {
                NavigationService.instance
                    .navigateToPage(Routes.popularNearDetail.name);
              },
            ),
            ShopList(
              imageFlex: 2,
              isHorizontal: true,
              cardHeight: context.dynamicHeight(0.3),
              cardWidth: context.dynamicHeight(0.32),
              listHeight: context.dynamicHeight(0.25),
              imageWidth: context.mediaQuery.size.width / 1.76,
            ),
          ],
        ),
      ),
    );
  }
}

class ShopList extends StatelessWidget {
  const ShopList({
    Key? key,
    required this.isHorizontal,
    required this.cardHeight,
    required this.cardWidth,
    required this.listHeight,
    required this.imageFlex,
    required this.imageWidth,
  }) : super(key: key);
  final bool isHorizontal;
  final double cardHeight;
  final double cardWidth;
  final double listHeight;
  final int imageFlex;
  final double imageWidth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ShopDetailBloc>().add(const FetchShopDetailEvent());
        NavigationService.instance.navigateToPage(Routes.shopDetail.name);
      },
      child: SizedBox(
        height: listHeight,
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
          itemBuilder: (context, index) {
            return ShopCard(
              isBig: false,
              imageFlex: imageFlex,
              shopModel: ShopDetailData(
                shop: Shop(
                  address: Address(),
                  name: "name",
                  phoneNumber: "1111111",
                  averageRating: 2,
                  genderPreference: "",
                  numRates: 2,
                  sId: "--",
                  serviceTypes: [],
                ),
              ),
              cardHeight: cardHeight,
              cardWidth: cardWidth,
              imageWidth: imageWidth,
            );
          },
        ),
      ),
    );
  }
}

Widget categoryTitle({
  required String title,
  required BuildContext context,
  VoidCallback? seeAllOnPressed,
}) {
  return Padding(
    padding: context.verticalPaddingNormal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextConstants.instance.heading6,
        ),
        CustomTextButton(
          onPressed: seeAllOnPressed,
          text: L10n.of(context)!.seeAll,
        )
      ],
    ),
  );
}

class _AlertDialogWidget extends StatelessWidget {
  const _AlertDialogWidget();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      content: SizedBox(
        width: context.dynamicWidth(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CountryDrop(provider: provider),
          ],
        ),
      ),
    );
  }
}
