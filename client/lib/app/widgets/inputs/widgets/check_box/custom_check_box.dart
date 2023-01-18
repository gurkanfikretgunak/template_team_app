import 'package:client/app/widgets/inputs/widgets/check_box/chech_box_label.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends BaseView {
  const CustomCheckbox({
    super.key,
    required this.title,
    this.subTitle,
    this.unselectedColor,
    this.disable,
    this.onChanged,
    required this.value,
  });

  final ECheckBox? disable;
  final ECheckBox? unselectedColor;
  final String title;
  final String? subTitle;
  final Function(bool?)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (unselectedColor == ECheckBox.unselectedDark)
          ? ECheckBoxLabel.unselectedDark()
          : ECheckBoxLabel.unselectedLight(),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        activeColor: ColorConstant.instance.purple2,
        value: value,
        controlAffinity: ListTileControlAffinity.leading,
        tristate: false,
        title: Text(
          title,
          style: TextConstants.instance.label1.copyWith(fontSize: 17),
        ),
        subtitle: subTitle == null
            ? null
            : Text(
                subTitle!,
                style: TextConstants.instance.paragraph2.copyWith(
                  color: ColorConstant.instance.dark3,
                ),
              ),
        side: BorderSide(color: ColorConstant.instance.purple2, width: 2),
        onChanged: disable == ECheckBox.disable ? null : onChanged,
      ),
    );
  }
}
