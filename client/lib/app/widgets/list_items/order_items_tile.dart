import 'package:client/app/widgets/icons/custom_min_icons.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';

class OrderItemsTile extends StatelessWidget {
  const OrderItemsTile({
    super.key,
    this.productCount,
    this.unitPrice,
    this.totalPrice,
    this.productName,
    this.onAdd,
    this.onRemove,
    this.isOrder = false,
  });
  final String? productName;
  final double? productCount;
  final double? unitPrice;
  final double? totalPrice;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final bool isOrder;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(productName ?? 'Product Name'),
      subtitle: isOrder
          ? Text('${unitPrice ?? '\$160'}')
          : Wrap(
              spacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: ColorConstant.instance.green0),
                    color: ColorConstant.instance.green4,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${productCount ?? 2}'),
                    ],
                  ),
                ),
                const Text('x'),
                Text('${unitPrice ?? '\$160'}'),
              ],
            ),
      trailing: Column(
        children: [
          isOrder
              ? ProductCountButton(onRemove: onRemove, productCount: productCount, onAdd: onAdd)
              : const SizedBox.shrink(),
          Expanded(child: Text('${totalPrice ?? '\$320'}')),
        ],
      ),
    );
  }
}

class ProductCountButton extends StatelessWidget {
  const ProductCountButton({
    Key? key,
    required this.onRemove,
    required this.productCount,
    required this.onAdd,
  }) : super(key: key);

  final VoidCallback? onRemove;
  final double? productCount;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorConstant.instance.purple2),
      ),
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(onTap: onRemove, child: const CustomMinIcon(imagePath: '../assets/icons/minus.png')),
          Text('${productCount ?? 2}'),
          InkWell(onTap: onAdd, child: const CustomMinIcon(imagePath: '../assets/icons/plus.png')),
        ],
      ),
    );
  }
}
