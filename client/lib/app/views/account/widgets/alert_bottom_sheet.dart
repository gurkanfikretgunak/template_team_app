import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/account/manage_address/manage_address.viewmodel.dart';
import 'package:client/app/views/account/payments/payment_home/payment.viewmodel.dart';
import 'package:client/app/views/auth/authentication/authentication.dart';
import 'package:client/app/views/auth/authentication/bloc/auth_bloc.dart';
import 'package:client/app/views/auth/authentication/bloc/auth_events.dart';
import 'package:client/app/views/auth/authentication/bloc/auth_states.dart';
import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/views/navigation/bloc/navigation_bloc.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_show_snack_bar.dart';

import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../auth/sign_in/bloc/login_bloc.dart';
import '../../navigation/bloc/navigation_event.dart';

class AlertBottomSheet extends StatelessWidget {
  const AlertBottomSheet({
    super.key,
    required this.title,
    required this.subTitle,
    required this.redButtonText,
    this.itemIndex,
    required this.whiteButtonText,
    this.paymentIndex,
  });
  final String title;
  final String subTitle;
  final String redButtonText;
  final int? itemIndex;
  final String whiteButtonText;
  final int? paymentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      listener: (context, state) {
        if (state is AuthenticationUnauthenticated) {
          NavigationService.instance
              .navigateToPageClear(path: Routes.signin.name);
          context.read<LoginBloc>().emailText.text = "";
          context.read<LoginBloc>().passwordText.text = "";
          BlocProvider.of<PageBloc>(context).add(ResetPage());
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextConstants.instance.heading6
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              context.emptySizedHeightBoxLow,
              Text(
                subTitle,
                style: TextConstants.instance.subtitle1
                    .copyWith(color: ColorConstant.instance.dark3),
              ),
              context.emptySizedHeightBoxNormal,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomOutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: whiteButtonText,
                      buttonSize: ButtonSize.large,
                    ),
                  ),
                  context.emptySizedWidthBoxNormal,
                  Expanded(
                    flex: 3,
                    child: CustomElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(AuthLoggedOutEvent());
                      },
                      text: redButtonText,
                      buttonColor: ButtonColor.red,
                      textColor: ButtonColor.light,
                      buttonSize: ButtonSize.large,
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
