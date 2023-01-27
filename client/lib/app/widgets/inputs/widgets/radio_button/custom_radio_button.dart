import 'package:client/app/widgets/inputs/widgets/radio_button/radio_button_notifier.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RadioButtonNotifier>(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          activeColor: ColorConstant.instance.purple2,
          selectedTileColor: ColorConstant.instance.purple2,
          title: Text(
            list[index],
            style: TextStyle(
              color: list[index] == provider.selectedOption
                  ? ColorConstant.instance.purple2
                  : ColorConstant.instance.dark0,
            ),
          ),
          value: list[index],
          groupValue: provider.selectedOption,
          onChanged: (value) {
            provider.setSelectedOption(value);
          },
        );
      },
    );
  }
}
