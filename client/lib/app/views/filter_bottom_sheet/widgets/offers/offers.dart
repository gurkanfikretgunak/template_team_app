import 'package:client/app/views/filter_bottom_sheet/widgets/offers/offer_notifier.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OffersFilter extends BaseView {
  const OffersFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final checkboxNotifier = Provider.of<OfferNotifier>(context);

    return ListView.builder(
      itemCount: checkboxNotifier.timingFilterOptions.length,
      itemBuilder: (context, index) {
        var key = checkboxNotifier.timingFilterOptions[index];

        return Padding(
          padding: context.horizontalPaddingNormal,
          child: CustomCheckbox(
            value: key['isSelected'],
            title: key['title'],
            onChanged: (value) {
              checkboxNotifier.setChange(key['title'], context);
            },
          ),
        );
      },
    );
  }
}
