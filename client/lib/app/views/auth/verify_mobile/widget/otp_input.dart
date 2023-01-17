import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({Key? key}) : super(key: key);

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 50,
            inactiveFillColor: Colors.white,
            activeColor: Colors.white),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: textEditingController,
        onCompleted: (v) {
          debugPrint("Completed");
        },
        onChanged: (value) {
          debugPrint(value);
          setState(() {
            currentText = value;
          });
        },
        beforeTextPaste: (text) {
          return true;
        },
        appContext: context,
      ),
    );
  }
}
