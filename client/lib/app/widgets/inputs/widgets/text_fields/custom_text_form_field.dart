import 'package:client/app/widgets/custom_text.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextFormField extends BaseView {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.hintTextColor,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
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
    this.enableBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.keyboardType = KeyboardType.name,
  }) : super(key: key);

  final int? maxLines;

  final int? maxLength;
  final Color? hintTextColor;
  final Color? iconColor;
  final String? hintText;
  final KeyboardType? keyboardType;
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
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? enableBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        CustomText(
          labelTextRequired == LabelText.required
              ? LabelTextLabel.required(labelTextValue!)
              : LabelTextLabel.notRequired(
                  labelTextValue ?? "",
                ),
          color: labelTextOpacity == LabelText.highOpacity
              ? LabelTextLabel.highOpacity()
              : LabelTextLabel.lowOpacity(),
        ),
        TextFormField(
          // inputFormatters: [MaskTextInputFormatter(mask: "+### ###-##-##")],
          key: key,
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          maxLength: maxLength,
          keyboardType: KeyboardTypeLabel().keyboardType(keyboardType),
          style: TextStyle(
            color: inputTextOpacity == InputText.highOpacity
                ? InputTextLabel.highOpacity()
                : InputTextLabel.lowOpacity(),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: context.normalValue, vertical: context.normalValue),
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
            hintText: hintText,
            hintStyle: TextStyle(color: ColorConstant.instance.dark3),
            enabledBorder: enabledBorder ??
                border(
                    borderSideColor:
                        TextFormFieldColorLabel().color(enabledBorderColor)),
            focusedBorder: focusedBorder ??
                border(
                  borderSideColor:
                      TextFormFieldColorLabel().color(focusedBorderColor),
                ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder border({required Color borderSideColor}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(color: borderSideColor),
    );
  }
}
