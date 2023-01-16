import 'package:client/app/widgets/inputs/widgets/drop_down/dd_hint_text.dart';
import 'package:client/app/widgets/inputs/widgets/drop_down/dropdown_button.viewmodel.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.list,
    required this.hintText,
  });

  final List<String> list;
  final DDHintText hintText;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DropDownButtonViewModel>(context);

    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.instance.light2,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: DropdownButton<String>(
        iconEnabledColor: ColorConstant.instance.dark0,
        underline: const SizedBox(),
        alignment: Alignment.center,
        style: TextConstants.instance.subtitle1,
        value: provider.dropDownSelectedValue,
        items: list
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (String? value) {
          provider.setDropDownSelectedValue(value!);
          provider.dropDownSelectedValue = value;
        },
        hint: Padding(
          padding: context.onlyLeftPaddingLow,
          child: Text(DDHintTextLabel().hintText(hintText)),
        ),
        icon: Container(
          padding: context.onlyRightPaddingLow,
          child: const Icon(Icons.keyboard_arrow_down),
        ),
      ),
    );
  }
}
