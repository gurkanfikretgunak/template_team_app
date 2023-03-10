import 'package:client/app/views/filter_bottom_sheet/widgets/gender/gender_notifier.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderFilter extends StatelessWidget {
  const GenderFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final checkboxNotifier = Provider.of<GenderNotifier>(context);

    return StatefulBuilder(
      builder: (context, setState) {
        return ListView.builder(
          itemCount: checkboxNotifier.genderFilterOptions(context).length,
          itemBuilder: (context, index) {
            var key = checkboxNotifier.genderFilterOptions(context)[index];

            return Padding(
              padding: context.horizontalPaddingNormal,
              child: CustomCheckbox(
                value: key['isSelected'],
                title: key['title'],
                onChanged: (value) {
                  setState(
                    () {
                      checkboxNotifier.setChange(key['title'], context);
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
