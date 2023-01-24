import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_l10n.dart';

class ShopPromoTile extends StatelessWidget {
  const ShopPromoTile({
    super.key,
    this.title,
    this.subtitle,
    this.buttonText,
    this.isApplied = false,
    this.isInvalid = false,
    this.promoCode,
    this.profit,
    this.onTap,
    this.onTryAgainTap,
    this.onRemoveTap,
  });
  final String? title;
  final String? subtitle;
  final String? promoCode;
  final double? profit;
  final String? buttonText;
  final bool isApplied;
  final bool isInvalid;
  final VoidCallback? onTap;
  final VoidCallback? onTryAgainTap;
  final VoidCallback? onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: 0, vertical: isApplied ? 4 : -4),
      isThreeLine: isApplied
          ? isInvalid
              ? false
              : true
          : false,
      leading: isApplied
          ? CustomIcon(imagePath: Assets.icons.inputCorrect.path)
          : isInvalid
              ? CustomIcon(imagePath: Assets.icons.inputWrong.path)
              : CustomIcon(imagePath: Assets.images.shop.offer.path),
      title: isApplied
          ? Text(title ?? 'Code ${promoCode ?? 'FREE10'} Applied!')
          : isInvalid
              ? Text(
                  title ?? 'Promo Code Invalid!',
                )
              : Text(title ?? L10n.of(context)!.offersPromoCode),
      subtitle: isApplied
          ? Text(subtitle ?? 'Coupon Applied Successfully')
          : isInvalid
              ? const Text('Sorry, this code works for only debit cards')
              : const SizedBox.shrink(),
      trailing: isApplied
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('-\$${profit ?? 40}'),
                CustomTextButton(
                  onPressed: onRemoveTap,
                  text: L10n.of(context)!.remove,
                  padding: EdgeInsets.zero,
                )
              ],
            )
          : isInvalid
              ? CustomTextButton(
                  onPressed: onTryAgainTap,
                  text: L10n.of(context)!.tryAgain,
                  padding: EdgeInsets.zero,
                  buttonSize: ButtonSize.small,
                )
              : InkWell(
                  onTap: onTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        L10n.of(context)!.viewOffers,
                        style: TextStyle(color: ColorConstant.instance.purple2),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorConstant.instance.purple2,
                        size: 20,
                      ),
                    ],
                  ),
                ),
    );
  }
}
