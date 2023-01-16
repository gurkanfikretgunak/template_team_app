import 'package:client/app/widgets/inputs/widgets/check_box/chech_box_label.dart';
import 'package:client/app/widgets/inputs/widgets/check_box/check_box_notifier.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCheckbox extends BaseView {
  const CustomCheckbox({
    super.key,
    this.disable,
    this.unselectedColor,
  });

  final ECheckBox? disable;
  final ECheckBox? unselectedColor;

  @override
  Widget build(BuildContext context) {
    final checkboxNotifier = Provider.of<CheckboxNotifier>(context);
    return Container(
      width: 14,
      height: 14,
      color: (unselectedColor == ECheckBox.unselectedDark)
          ? ECheckBoxLabel.unselectedDark()
          : ECheckBoxLabel.unselectedLight(),
      child: Checkbox(
        activeColor: ColorConstant.instance.purple2,
        hoverColor: ColorConstant.instance.purple2,
        value: checkboxNotifier.isChecked,
        focusColor: ColorConstant.instance.red0,
        tristate: false,
        onChanged: disable == ECheckBox.disable
            ? null
            : (value) {
                checkboxNotifier.toggleCheck();
              },
        fillColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorConstant.instance.purple4;
            }
            return ColorConstant.instance.purple2;
          },
        ),
      ),
    );
  }
}
