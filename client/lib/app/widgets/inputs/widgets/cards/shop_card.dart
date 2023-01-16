import 'package:client/app/widgets/list_items/list_items_widget.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  ShopCard(
      {super.key,
      required this.genderType,
      required this.shopName,
      required this.imagePath,
      required this.shopTypes,
      required this.address,
      required this.rating,
      required this.distance,
      required this.hasDiscount,
      this.discountAmount});

  final String genderType, shopName, imagePath, address, shopTypes;
  final double rating, distance;
  final double? discountAmount;
  final bool hasDiscount;

  final textConsts = TextConstants.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              width: double.infinity,
              child: Stack(fit: StackFit.expand, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                      imagePath,
                    ),
                  ),
                ),
                if (hasDiscount)
                  SizedBox(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          child: CircularService(
                            hasPrefixIcon: true,
                            title: '${discountAmount ?? 0}% Off',
                            textColor: ColorConstant.instance.purple2,
                          ),
                        ),
                      ),
                    ),
                  )
              ]),
            )),
        Expanded(
            flex: 1,
            child: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    genderType,
                    style: textConsts.label2,
                  ),
                  Text(
                    shopName,
                    style: textConsts.heading6,
                  ),
                  Row(
                    children: [
                      Text(
                        shopTypes,
                        style: textConsts.paragraph2,
                      ),
                      const DotIconWidget(),
                      Icon(
                        Icons.star_outline,
                        size: 16,
                        color: ColorConstant.instance.dark3,
                      ),
                      Text(
                        rating.toString(),
                        style: textConsts.button3,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        address,
                        style: textConsts.paragraph2,
                      ),
                      const DotIconWidget(),
                      Text(
                        '$distance Kms',
                        style: textConsts.subtitle2,
                      ),
                      const DotIconWidget(),
                      Text(
                        '\$\$',
                        style: textConsts.subtitle2,
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
