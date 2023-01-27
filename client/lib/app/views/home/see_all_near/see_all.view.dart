import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/shop/shop.widget.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import '../widgets/filter_list.dart';

class SeeAllNearView extends BaseView with ShopHomeWidgets {
  const SeeAllNearView({super.key});

  @override
  Widget build(BuildContext context) {
    return baseBuild(
      context,
      appbar: CustomAppbar(title: L10n.of(context)!.popularNearYou),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: context.paddingNormal,
              child: const FilterList(),
            ),
          ),
          ShopHomeWidgets().body(context)
        ],
      ),
    );
  }
}
