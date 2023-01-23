import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/home/widgets/offer_button.dart';
import 'package:client/app/views/home/widgets/rating_button.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FilterListViewModel {
  List<Widget> filterItems(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);

    return [
      genderDropDown(provider, context),
      priceDropDown(provider, context),
      const OfferButton(),
      const RatingButton(),
    ];
  }

  CustomDropdownButton<String> priceDropDown(
      HomeViewModel provider, BuildContext context) {
    List<String> priceList = [
      L10n.of(context)!.lowestPrice,
      L10n.of(context)!.highestPrice,
    ];
    return CustomDropdownButton<String>(
      value: provider.ddPriceValue,
      onChanged: (String? value) {
        provider.setDropDownPriceValue(value!);
        provider.ddPriceValue = value;
      },
      list: priceList,
      hintText: DDHintText.price,
    );
  }

  CustomDropdownButton<dynamic> genderDropDown(
      HomeViewModel provider, BuildContext context) {
    List<String> genderList = [
      L10n.of(context)!.women,
      L10n.of(context)!.man,
    ];
    return CustomDropdownButton(
      value: provider.ddGenderValue,
      onChanged: (String? value) {
        provider.setDropDownGenderValue(value!);
        provider.ddGenderValue = value;
      },
      list: genderList,
      hintText: DDHintText.gender,
    );
  }
}
