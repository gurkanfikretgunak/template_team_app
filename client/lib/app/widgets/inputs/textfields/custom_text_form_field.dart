import 'package:client/core/constans/color_constants.dart';
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
    this.enabledBorder,
    this.maxLength,
    this.keyboardType,
    this.maxLines,
    this.labelText,
    this.labelTextColor,
    this.focusedBorder,
    this.onTap,
    this.validator,
    this.iconColor,
    this.focusedBorderColor,
  }) : super(key: key);

  final int? maxLines;

  final int? maxLength;
  final Color? hintTextColor;
  final Color? labelTextColor;
  final Color? iconColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final Color? focusedBorderColor;
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
          style: TextStyle(
            color: ColorConstant.instance.dark0,
          ),
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintTextColor,
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: labelTextColor ?? ColorConstant.instance.dark0,
            ),
            enabledBorder: border(
              borderSideColor: ColorConstant.instance.dark4,
            ),
            focusedBorder: border(
              borderSideColor:
                  focusedBorderColor ?? ColorConstant.instance.purple2,
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
        Radius.circular(16),
      ),
      borderSide: BorderSide(color: borderSideColor),
    );
  }
}
