import 'package:client/app/views/filter_bottom_sheet/widgets/offers/offer_notifier.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/app/widgets/inputs/widgets/radio_button/custom_radio_button.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfferAlertDialog extends StatelessWidget {
  const OfferAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final checkboxNotifier = Provider.of<OfferNotifier>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
      content: SingleChildScrollView(
        child: SizedBox(
          width: context.dynamicWidth(1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              ListView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
