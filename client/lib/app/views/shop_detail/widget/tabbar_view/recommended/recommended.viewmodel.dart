import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';

class RecommendedViewModel extends BaseViewModel {
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  // List<Map<String, dynamic>> recommendList(BuildContext context) {
  //   return [
  //     {
  //       "image": Assets.images.shop.shopDetail10.path,
  //       "name": L10n.of(context)!.charcoalDetoxMask,
  //       "count": 2
  //     },
  //     {
  //       "image": Assets.images.shop.shopDetail2.path,
  //       "name": L10n.of(context)!.haircut,
  //       "count": 1
  //     },
  //     {
  //       "image": Assets.images.shop.shopDetail6.path,
  //       "name": L10n.of(context)!.shave,
  //       "count": 3
  //     },
  //   ];
  // }

  List<Map<String, dynamic>> recommendList(BuildContext context) {
    return [
      {"image": Assets.images.shop.shopDetail10.path, "name": L10n.of(context)!.charcoalDetoxMask, "count": count1},
      {"image": Assets.images.shop.shopDetail2.path, "name": L10n.of(context)!.haircut, "count": count2},
      {
        "image": Assets.images.shop.shopDetail6.path,
        "name": L10n.of(context)!.shave,
        "count": count3,
      },
    ];
  }

  incrementCount(BuildContext context, index) {
    switch (index) {
      case 0:
        count1 = count1 + 1;

        notifyListeners();
        break;
      case 1:
        count2 = count2 + 1;
        notifyListeners();
        break;

      case 2:
        count3 = count3 + 1;
        notifyListeners();
        break;

      default:
        notifyListeners();
    }
  }

  decrementCount(BuildContext context, index) {
    switch (index) {
      case 0:
        count1 = count1 - 1;
        notifyListeners();
        break;
      case 1:
        count2 = count2 - 1;
        notifyListeners();
        break;

      case 2:
        count3 = count3 - 1;
        notifyListeners();
        break;

      default:
        notifyListeners();
    }
  }
}
