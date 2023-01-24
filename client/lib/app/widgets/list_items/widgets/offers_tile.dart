import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class OffersTile extends StatelessWidget {
  const OffersTile({
    super.key,
    this.offerCustomIcon,
    this.offerTitle,
    this.offerSubtitle,
    this.offerButtonText,
    this.onPressed,
  });
  final String? offerCustomIcon;
  final String? offerTitle;
  final String? offerSubtitle;
  final String? offerButtonText;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: context.dynamicHeight(0.2),
        width: context.dynamicWidth(0.13),
        child: CustomIcon(
          imagePath: offerCustomIcon ?? Assets.icons.visa.path,
          width: IconSize.large,
          height: IconSize.large,
        ),
      ),
      title: Text(offerTitle ?? 'Get cashback upto \$40 on VISA Debit or Credit cards'),
      subtitle: Text(offerSubtitle ?? 'On booking of \$200 or more.'),
      trailing: CustomTextButton(
        text: offerButtonText ?? L10n.of(context)!.apply,
        onPressed: onPressed,
      ),
    );
  }
}
