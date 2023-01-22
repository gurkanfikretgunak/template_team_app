import 'package:client/app/views/shop_detail/shop_detail.widget.dart';
import 'package:client/app/views/shop_detail/widget/sliver_shop_detail.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ShopDetailView extends BaseView with ShopDetailWidgets {
  const ShopDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var fake = Faker();

    return baseBuild(
      context,
      body: SliverShopDetailWidget(
        address: fake.address.city(),
        shopName: fake.company.name(),
        shopTypes: fake.company.name(),
        discountAmount: fake.randomGenerator.integer(20).toDouble(),
        rating: fake.randomGenerator.integer(20).toDouble(),
      ),
    );
  }
}
