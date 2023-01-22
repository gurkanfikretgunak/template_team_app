import 'package:client/app/l10n/app_l10n.dart';
import 'package:flutter/widgets.dart';

enum DDHintText {
  gender,
  price,
  rating,
}

class DDHintTextLabel {
  DDHintTextLabel();

  hintText(hintText, BuildContext context) {
    switch (hintText) {
      case DDHintText.gender:
        return L10n.of(context)!.gender;

      case DDHintText.price:
        return L10n.of(context)!.price;
      case DDHintText.rating:
        return L10n.of(context)!.rating;
    }
  }
}
