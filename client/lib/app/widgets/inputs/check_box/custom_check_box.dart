import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckboxNotifier extends ChangeNotifier {
  bool _isChecked = false;
  bool get isChecked => _isChecked;

  void toggleCheck() {
    _isChecked = !_isChecked;
    notifyListeners();
  }
}

class CustomCheckbox extends StatelessWidget {
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

enum ECheckBox {
  disable,
  enable,
  unselectedLight,
  unselectedDark,
}

class ECheckBoxLabel {
  ECheckBoxLabel();

  static Color unselectedDark() => ColorConstant.instance.purple2;
  static Color unselectedLight() => ColorConstant.instance.light4;
}
