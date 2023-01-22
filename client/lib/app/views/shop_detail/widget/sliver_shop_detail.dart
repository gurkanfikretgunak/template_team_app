import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/constans/color_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/image_viewer/icons/widgets/custom_icons.dart';
import '../../../widgets/image_viewer/icons/widgets/icon_size.dart';
import '../../../widgets/inputs/widgets/shop_cards/shop_card_widgets.dart';
import '../shop_detail.widget.dart';

class SliverShopDetailWidget extends StatefulWidget with ShopDetailWidgets {
  const SliverShopDetailWidget(
      {super.key,
      required this.shopName,
      required this.shopTypes,
      required this.rating,
      required this.address,
      required this.discountAmount});
  final String shopName;
  final String shopTypes;
  final double rating;
  final String address;
  final double discountAmount;
  @override
  State<SliverShopDetailWidget> createState() => _SliverShopDetailWidgetState();
}

class _SliverShopDetailWidgetState extends State<SliverShopDetailWidget> {
  late ScrollController _scrollDetailController;

  Color? _textColor = ColorConstant.instance.light4;
  bool? isColor = true;

  @override
  void initState() {
    super.initState();

    _scrollDetailController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? ColorConstant.instance.dark0 : ColorConstant.instance.light4;
          isColor = _isSliverAppBarExpanded ? false : true;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollDetailController.hasClients && _scrollDetailController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollDetailController,
      slivers: <Widget>[
        SliverAppBar(
          leading: BackButton(
            color: _textColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Image.asset(
              Assets.icons.search.path,
              color: _textColor,
            )
          ],
          pinned: true,
          snap: false,
          floating: true,
          expandedHeight: 180.0,
          forceElevated: true,
          bottom: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            toolbarHeight: 100.0,
            title: SizedBox(
              height: 80,
              child: ShopCardWidgets().shopInformation(context, widget.shopName, widget.shopTypes, widget.rating,
                  widget.address, widget.discountAmount, isColor!),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: const EdgeInsetsDirectional.only(start: 10.0, bottom: 10.0, end: 50),
            background: Stack(
              children: [
                SizedBox(
                    width: context.width, child: Image.asset(Assets.images.shop.homeShop1.path, fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 130, start: 380),
                  child: CustomIcon(
                      imagePath: "assets/icons/heart.png",
                      height: IconSize.large,
                      width: IconSize.large,
                      iconColor: ColorConstant.instance.light4),
                ),
              ],
            ),
          ),
        ),
        ShopDetailWidgets().shopDetailBody(context),
        ShopDetailWidgets().buildTabbarView(context)
      ],
    );
  }
}
