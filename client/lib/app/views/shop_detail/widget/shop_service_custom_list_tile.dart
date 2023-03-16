import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/shop_detail/shop_detail.viewmodel.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_card.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tabbar_view/recommended/recommended.viewmodel.dart';

class ShopServiceCustomListTile extends StatelessWidget {
  const ShopServiceCustomListTile({
    super.key,
    this.shopService,
    required this.index,
    this.image,
    this.name,
    this.duration,
    this.cost,
  });
  final Map? shopService;
  final String? image;
  final String? name;
  final int? duration;
  final int? cost;

  final int index;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ShopDetailViewModel>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                image!,
              ),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        Expanded(
          child: Wrap(
            spacing: 8,
            direction: Axis.vertical,
            children: [
              Text(name ?? L10n.of(context)!.haircut),
              Text(cost.toString()),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 2,
                children: [
                  const Icon(Icons.access_time),
                  Text('$duration ${L10n.of(context)!.mins}'),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.pink,
            ),
          ],
        ),
        Consumer<RecommendedViewModel>(
          builder: (context, value, child) {
            return value.recommendList(context)[index]['count'] > 0
                ? CustomCard(
                    width: context.dynamicWidth(0.2),
                    borderSideColor: ColorConstant.instance.purple2,
                    child: FittedBox(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              value.incrementCount(context, index);
                            },
                            child: IconButton(
                              onPressed: () {
                                value.incrementCount(context, index);
                                vm.selectedShopCard(40);
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ),
                          Text(
                            value
                                .recommendList(context)[index]['count']
                                .toString(),
                          ),
                          IconButton(
                            onPressed: () {
                              value.decrementCount(context, index);
                              vm.decrementShopCard();
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                  )
                : CustomOutlinedButton(
                    onPressed: () {
                      value.incrementCount(context, index);

                      vm.selectedShopCard(40);
                    },
                    buttonSize: ButtonSize.small,
                    child:
                        Icon(Icons.add, color: ColorConstant.instance.purple2),
                  );
          },
        ),
      ],
    );
  }
}
