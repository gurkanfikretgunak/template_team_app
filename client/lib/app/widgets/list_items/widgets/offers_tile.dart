import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/icons/icons_widgets.dart';
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
      leading: CustomIcon(imagePath: offerCustomIcon ?? '../assets/icons/visa.png'),
      title: Text(offerTitle ?? 'Get cashback upto \$40 on VISA Debit or Credit cards'),
      subtitle: Text(offerSubtitle ?? 'On booking of \$200 or more.'),
      trailing: CustomTextButton(
        text: offerButtonText ?? 'Apply',
        onPressed: onPressed,
      ),
    );
  }
}
