import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/timing/timing_notifier.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimingFilter extends StatelessWidget {
  const TimingFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final checkboxNotifier = Provider.of<TimingNotifier>(context);

    return ListView.builder(
      itemCount: checkboxNotifier.timingFilterOptions(context).length,
      itemBuilder: (context, index) {
        var key = checkboxNotifier.timingFilterOptions(context)[index];

        return Padding(
          padding: context.horizontalPaddingNormal,
          child: CustomCheckbox(
            value: key['isSelected'],
            title: key['title'],
            subTitle: key['subTitle'],
            onChanged: (value) {
              checkboxNotifier.setChange(index, context);
            },
          ),
        );
      },
    );
  }
}
