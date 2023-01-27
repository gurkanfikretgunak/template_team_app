import 'package:client/app/views/auth/verification/verify_otp/verify_otp.viewmodel.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({Key? key}) : super(key: key);
  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.dynamicWidth(0.7),
        child: PinCodeTextField(
          length: 4,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: pinTheme(),
          animationDuration: context.durationNormal,
          enableActiveFill: true,
          controller: textEditingController,
          onCompleted: onComplated,
          onChanged: onChanged,
          beforeTextPaste: beforeTextPaste,
          appContext: context,
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  bool beforeTextPaste(text) {
    return true;
  }

  void onChanged(value) {
    final provider = Provider.of<VerifyOtpViewModel>(context, listen: false);
    Logger().i(value);
    provider.otpText = value;
  }

  void onComplated(v) {
    Logger().i("Complated");
  }

  PinTheme pinTheme() {
    return PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(5),
      errorBorderColor: ColorConstant.instance.green0,
      fieldHeight: 50,
      fieldWidth: 50,
      activeColor: ColorConstant.instance.dark3,
      selectedColor: ColorConstant.instance.dark3,
      selectedFillColor: ColorConstant.instance.light4,
      activeFillColor: ColorConstant.instance.light4,
      inactiveFillColor: ColorConstant.instance.light4,
      inactiveColor: ColorConstant.instance.dark4,
    );
  }
}
