import 'package:client/app/views/auth/sign_up/sign_up.viewmodel.dart';
import 'package:client/app/widgets/custom_text.dart';
import 'package:client/app/widgets/inputs/inputs_widgets.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../search_field/search_field_notification.dart';

class CustomTextFormField extends BaseView {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.errorText,
    this.inputFormatters,
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
    required this.isVisible,
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
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchFieldNotifier>(context);
    final providerSignUp = Provider.of<SignUpViewModel>(context);

    return Wrap(
      runSpacing: 5,
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
          inputFormatters: inputFormatters,
          key: key,
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          maxLength: maxLength,
          obscureText: providerSignUp.obscureText,
          onFieldSubmitted: (value) {
            provider.searchRecently(value);
          },
          keyboardType: KeyboardTypeLabel().keyboardType(keyboardType),
          style: TextStyle(
            color: inputTextOpacity == InputText.highOpacity
                ? InputTextLabel.highOpacity()
                : InputTextLabel.lowOpacity(),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: context.normalValue,
              vertical: context.normalValue,
            ),
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
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: ColorConstant.instance.dark3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: errorText == null
                    ? ColorConstant.instance.purple3
                    : ColorConstant.instance.red2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: errorText == null
                      ? ColorConstant.instance.purple3
                      : ColorConstant.instance.red2,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.black, width: 1.0)),
            suffixIcon: GestureDetector(
                onTap: () {
                  if (isVisible) {
                    providerSignUp.passwordVisibleCheck();
                  } else {
                    controller!.clear();
                  }
                },
                child: isVisible
                    ? providerSignUp.obscureText
                        ? Icon(
                            Icons.visibility_off_rounded,
                            color: ColorConstant.instance.purple4,
                          )
                        : Icon(
                            Icons.visibility_rounded,
                            color: ColorConstant.instance.purple3,
                          )
                    : _CustomClearSuffixIcon(
                        controller: controller,
                      )),
            prefixIcon: prefixIcon,
            errorText: errorText,
          ),
        )
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

class _CustomClearSuffixIcon extends StatelessWidget {
  const _CustomClearSuffixIcon({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return controller!.text.isNotEmpty
        ? Stack(
            alignment: const Alignment(0.0, 0.0),
            children: [
              Container(
                width: 17,
                height: 17,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[350]),
              ),
              const Icon(
                Icons.clear,
                size: 30 * 0.4,
                color: Colors.white,
              )
            ],
          )
        : const SizedBox();
  }
}
