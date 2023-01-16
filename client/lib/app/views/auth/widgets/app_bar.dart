import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_text_button.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextConstants.instance.heading4,
              ),
              Row(
                children: [
                  Text(
                    'Already have an Account ?',
                    style: TextConstants.instance.heading6,
                  ),
                  CustomTextButton(
                    onPressed: () {},
                    text: "Login",
                    buttonSize: ButtonSize.medium,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
