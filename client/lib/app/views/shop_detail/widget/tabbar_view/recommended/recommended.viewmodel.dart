import 'package:client/core/base/view_model/base_view_model.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';

class RecommendedViewModel extends BaseViewModel {
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

  List<Map<String, dynamic>> recommendList = [
    {
      "image": Assets.images.shop.shopDetail10.path,
      "name": "charcoalDetoxMask",
      "count": 0
    },
    {
      "image": Assets.images.shop.shopDetail2.path,
      "name": "haircut",
      "count": 0
    },
    {
      "image": Assets.images.shop.shopDetail6.path,
      "name": "shave",
      "count": 0,
    },
  ];
  incrementCount(BuildContext context, index) {
    switch (index) {
      case 0:
        recommendList[0]['count'] = recommendList[0]['count'] + 1;

        notifyListeners();
        break;
      case 1:
        recommendList[1]['count'] = recommendList[1]['count'] + 1;

        notifyListeners();
        break;

      case 2:
        recommendList[2]['count'] = recommendList[2]['count'] + 1;

        notifyListeners();
        break;

      default:
        notifyListeners();
    }
  }

  decrementCount(BuildContext context, index) {
    switch (index) {
      case 0:
        recommendList[0]['count'] = recommendList[0]['count'] - 1;

        notifyListeners();
        break;
      case 1:
        recommendList[1]['count'] = recommendList[1]['count'] - 1;

        notifyListeners();
        break;

      case 2:
        recommendList[2]['count'] = recommendList[2]['count'] - 1;

        notifyListeners();
        break;

      default:
        notifyListeners();
    }
  }
}
