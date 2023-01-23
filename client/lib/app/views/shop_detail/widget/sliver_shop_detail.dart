import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constans/color_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/inputs/widgets/shop_cards/shop_card_widgets.dart';
import '../../search/widgets/search_bar.widget.dart';
import '../shop_detail.viewmodel.dart';
import '../shop_detail.widget.dart';

class SliverShopDetailWidget extends StatefulWidget with ShopDetailWidgets {
  const SliverShopDetailWidget({super.key, required this.shopModel});
  final BookingModel shopModel;
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
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchBarWidget()));
              },
              child: Image.asset(
                Assets.icons.search.path,
                color: _textColor,
              ),
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
              child: ShopCardWidgets().shopInformation(
                context,
                widget.shopModel.title,
                widget.shopModel.location,
                widget.shopModel.price,
                widget.shopModel.title,
                widget.shopModel.distance,
                isColor!,
              ),
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
                  padding: const EdgeInsetsDirectional.only(top: 130, start: 350),
                  child: Consumer<ShopDetailViewModel>(
                    builder: (context, value, child) {
                      bool favoriteShopDetail = value.isDetailFavorite(widget.shopModel);

                      return IconButton(
                          onPressed: () {
                            value.favShopDetail(widget.shopModel, !favoriteShopDetail);
                          },
                          icon: AnimatedCrossFade(
                            firstChild: Icon(
                              Icons.favorite,
                              color: ColorConstant.instance.purple2,
                            ),
                            secondChild: const Icon(Icons.favorite_border),
                            crossFadeState: favoriteShopDetail ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            duration: const Duration(seconds: 1),
                          ));
                    },
                  ),
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
