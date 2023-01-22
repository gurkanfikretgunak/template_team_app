import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constans/color_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../../home/home.widgets.dart';
import '../shop.widget.dart';

class SliverShopWidget extends StatefulWidget with ShopHomeWidgets {
  const SliverShopWidget({super.key});

  @override
  State<SliverShopWidget> createState() => _SliverShopWidgetState();
}

class _SliverShopWidgetState extends State<SliverShopWidget> {
  late ScrollController _scrollController;

  Color? _textColor = ColorConstant.instance.light4;
//----------
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? ColorConstant.instance.dark0 : ColorConstant.instance.light4;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients && _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          snap: false,
          floating: false,
          expandedHeight: 180.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: const EdgeInsetsDirectional.only(start: 10.0, bottom: 10.0, end: 50),
            title: Text(
              "Haircut for Men",
              style: TextConstants.instance.heading5.copyWith(color: _textColor),
            ),
            background: Stack(
              children: [
                SizedBox(
                    width: context.width, child: Image.asset(Assets.images.shop.homeShop1.path, fit: BoxFit.cover)),
                BackButton(
                  color: ColorConstant.instance.light4,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ShopHomeWidgets().dropDownCity(context, true),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: context.paddingNormal,
            child: const SizedBox(height: 40, child: FilterList()),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: context.onlyLeftPaddingNormal,
            child: Text("102 shops giving Haircut service", style: TextConstants.instance.label1),
          ),
        ),
        ShopHomeWidgets().body(context)
      ],
    );
  }
}
