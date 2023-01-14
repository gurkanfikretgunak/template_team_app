import 'package:client/app/widgets/icons/custom_max_icons.dart';
import 'package:client/app/widgets/inputs/text_fields/widgets/help_text.dart';
import 'package:client/app/widgets/inputs/text_fields/widgets/input_text.dart';
import 'package:client/app/widgets/inputs/text_fields/widgets/label_text.dart';
import 'package:client/app/widgets/inputs/text_fields/widgets/textformfield_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.hintTextColor,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.keyboardType,
    this.maxLines,
    this.onTap,
    this.validator,
    this.iconColor,
    this.helpTextLabel = HelpText.off,
    this.helpTextLabelValue = 'Place Holde Help Text',
    this.helpTextOpacity = HelpText.highOpacity,
    this.labelTextOpacity = LabelText.highOpacity,
    this.labelTextValue,
    this.labelTextRequired = LabelText.notRequired,
    this.inputTextOpacity = InputText.highOpacity,
    this.enabledBorderColor = TextFormFieldColor.dark,
    this.focusedBorderColor = TextFormFieldColor.purple,
    this.suffixIconColor = TextFormFieldColor.dark,
    this.prefixIconColor = TextFormFieldColor.dark,
  }) : super(key: key);

  final int? maxLines;

  final int? maxLength;
  final Color? hintTextColor;
  final Color? iconColor;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final HelpText? helpTextLabel;
  final String? helpTextLabelValue;
  final HelpText? helpTextOpacity;
  final LabelText? labelTextOpacity;
  final String? labelTextValue;
  final LabelText? labelTextRequired;
  final InputText? inputTextOpacity;
  final TextFormFieldColor? focusedBorderColor;
  final TextFormFieldColor? enabledBorderColor;
  final String? suffixIcon;
  final String? prefixIcon;
  final TextFormFieldColor? suffixIconColor;
  final TextFormFieldColor? prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: key,
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          style: TextStyle(
            color: inputTextOpacity == InputText.highOpacity
                ? InputTextLabel.highOpacity()
                : InputTextLabel.lowOpacity(),
          ),
          maxLength: maxLength,
          decoration: InputDecoration(
            helperText: helpTextLabel == HelpText.off
                ? HelpTextLabel.off()
                : HelpTextLabel.on(
                    helpTextLabelValue!,
                  ),
            helperStyle: TextStyle(
              color: helpTextOpacity == HelpText.highOpacity
                  ? HelpTextLabel.highOpacity()
                  : HelpTextLabel.lowOpacity(),
            ),
            labelText: labelTextRequired == LabelText.required
                ? LabelTextLabel.required(labelTextValue!)
                : LabelTextLabel.notRequired(labelTextValue!),
            labelStyle: TextStyle(
              color: labelTextOpacity == LabelText.highOpacity
                  ? LabelTextLabel.highOpacity()
                  : LabelTextLabel.lowOpacity(),
            ),
            enabledBorder: border(
              borderSideColor:
                  TextFormFieldColorLabel().color(enabledBorderColor),
            ),
            focusedBorder: border(
              borderSideColor:
                  TextFormFieldColorLabel().color(focusedBorderColor),
            ),
            suffixIcon: CustomMaxIcon(
              imagePath: suffixIcon,
              iconColor: TextFormFieldColorLabel().color(suffixIconColor),
            ),
            prefix: CustomMaxIcon(
              imagePath: prefixIcon,
              iconColor: TextFormFieldColorLabel().color(prefixIconColor),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder border({required Color borderSideColor}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      borderSide: BorderSide(color: borderSideColor),
    );
  }
}
