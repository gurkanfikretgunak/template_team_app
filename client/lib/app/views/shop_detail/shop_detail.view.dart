import 'package:client/app/views/shop_detail/shop_detail.widget.dart';
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
      appbar: PreferredSize(
        preferredSize: const Size.fromHeight(250.0),
        child: shopDetailAppBar(
          context,
          fake.company.name(),
          fake.address.city(),
          fake.company.name(),
          fake.randomGenerator.integer(20).toDouble(),
          fake.randomGenerator.integer(20).toDouble(),
        ),
      ),
      body: shopDetailBody(context),
    );
  }
}
