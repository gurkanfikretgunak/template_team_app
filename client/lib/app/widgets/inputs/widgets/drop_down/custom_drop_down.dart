import 'package:client/app/widgets/inputs/widgets/drop_down/dd_hint_text.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.list,
    required this.hintText,
    required this.value,
    required this.onChanged,
  });

  final List<String> list;
  final DDHintText hintText;
  final String? value;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.instance.light2,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Center(
        child: DropdownButton(
          iconEnabledColor: ColorConstant.instance.dark0,
          underline: const SizedBox(),
          alignment: Alignment.center,
          style: TextConstants.instance.subtitle2,
          value: value,
          items: list
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: FittedBox(child: Text(e)),
                  ))
              .toList(),
          onChanged: onChanged,
          hint: Padding(
            padding: context.onlyLeftPaddingLow,
            child: Padding(
              padding: context.horizontalPaddingLow,
              child: Text(DDHintTextLabel().hintText(hintText, context)),
            ),
          ),
          icon: const FittedBox(child: Icon(Icons.keyboard_arrow_down)),
        ),
      ),
    );
  }
}
