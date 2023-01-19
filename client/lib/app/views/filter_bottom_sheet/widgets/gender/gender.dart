import 'package:client/app/views/filter_bottom_sheet/widgets/gender/gender_notifier.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderFilter extends StatefulWidget {
  const GenderFilter({super.key});

  @override
  State<GenderFilter> createState() => _GenderFilterState();
}

class _GenderFilterState extends State<GenderFilter> {
  @override
  Widget build(BuildContext context) {
    final checkboxNotifier = Provider.of<GenderNotifier>(context);

    return ListView.builder(
      itemCount: checkboxNotifier.genderFilterOptions.length,
      itemBuilder: (context, index) {
        var key = checkboxNotifier.genderFilterOptions[index];

        return Padding(
          padding: context.horizontalPaddingNormal,
          child: CustomCheckbox(
            value: key['isSelected'],
            title: key['title'],
            onChanged: (value) {
              checkboxNotifier.setChange(key['title']);
            },
          ),
        );
      },
    );
  }
}
