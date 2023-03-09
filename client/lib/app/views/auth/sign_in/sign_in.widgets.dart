import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/auth/sign_in/bloc/login_bloc.dart';
import 'package:client/app/views/auth/sign_in/bloc/login_events.dart';
import 'package:client/app/views/auth/sign_in/bloc/login_states.dart';
import 'package:client/app/views/auth/widgets/custom_social_icon.dart';
import 'package:client/app/views/auth/widgets/social_image_path.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/buttons/widgets/custom_text_button.dart';
import 'package:client/app/widgets/custom_text.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/core/init/cache/token_cache_manager/token_cache_manager.dart';
import 'package:client/core/provider/validation/validator_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInWidgets {
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.onlyLRTBpaddingNormal,
        child: Wrap(
          runSpacing: 20,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleTexts(context),
            textFormFieldsAndButton(context),
            forgotPasswordText(context),
            divider(context),
            loginWithOrganization(context),
          ],
        ),
      ),
    );
  }

  Center loginWithOrganization(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomSocialIcon(
            imagePath: SocialPath.google,
            height: IconSize.large,
            width: IconSize.large,
            socialName: L10n.of(context)!.continueWithGoogle,
          ),
          CustomSocialIcon(
            imagePath: SocialPath.apple,
            height: IconSize.large,
            width: IconSize.large,
            socialName: L10n.of(context)!.continueWithApple,
          ),
        ],
      ),
    );
  }

  Row divider(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: CustomDivider()),
        Padding(
          padding: context.horizontalPaddingMedium,
          child: Text(L10n.of(context)!.or),
        ),
        const Expanded(child: CustomDivider()),
      ],
    );
  }

  Center forgotPasswordText(BuildContext context) {
    return Center(
      child: CustomTextButton(
        onPressed: () {
          NavigationService.instance.navigateToPage(Routes.forgotPassword.name);
        },
        text: L10n.of(context)!.forgotPassword,
        buttonSize: ButtonSize.large,
      ),
    );
  }

  Widget textFormFieldsAndButton(BuildContext context) {
    final providerValidation = Provider.of<FormViewModel>(context);

    return BlocBuilder<LoginBloc, LoginState>(builder: (context, data) {
      return Column(
        children: [
          Wrap(
            children: [
              CustomTextFormField(
                  isVisible: false,
                  labelTextValue: L10n.of(context)!.email,
                  hintText: "johndoe@gmail.com",
                  controller: context.read<LoginBloc>().emailText,
                  onChanged: providerValidation.validateEmail,
                  errorText: providerValidation.email.error),
              CustomTextFormField(
                  isVisible: true,
                  labelTextValue: L10n.of(context)!.password,
                  controller: context.read<LoginBloc>().passwordText,
                  hintText: L10n.of(context)!.setPassword,
                  onChanged: providerValidation.validatePassword,
                  errorText: providerValidation.password.error),
            ],
          ),
          context.emptySizedHeightBoxNormal,
          SizedBox(
            width: context.dynamicWidth(1),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginInitialState) {
                  return CustomElevatedButton(
                    onPressed: () async {
                      context.read<LoginBloc>().add(const LoginButtonEvent());
                    },
                    text: L10n.of(context)!.login,
                    buttonSize: ButtonSize.large,
                    buttonColor: ButtonColor.purple,
                    textColor: ButtonColor.light,
                  );
                }
                if (state is LoginLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
                if (state is LoginLoadedState) {
                  Future.delayed(Duration.zero, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavigationView(false)));
                  });
                }

                return Column(
                  children: [
                    CustomText(
                      "Lütfen Tekrar Deneyiniz.",
                      color: ColorConstant.instance.red0,
                    ),
                    context.emptySizedHeightBoxNormal,
                    SizedBox(
                      width: context.dynamicWidth(1),
                      child: CustomElevatedButton(
                        onPressed: () async {
                          context
                              .read<LoginBloc>()
                              .add(const LoginButtonEvent());
                        },
                        text: L10n.of(context)!.login,
                        buttonSize: ButtonSize.large,
                        buttonColor: ButtonColor.purple,
                        textColor: ButtonColor.light,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    });
  }

  Column titleTexts(BuildContext context) {
    final TokenCacheManager tokenCacheManager = TokenCacheManager();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomElevatedButton(
                textColor: ButtonColor.light,
                onPressed: () async {
                  tokenCacheManager.writeItem("a", "value");
                  Logger().e("a");
                },
                text: "write"),
            CustomElevatedButton(
                textColor: ButtonColor.light,
                onPressed: () {
                  Logger().e(tokenCacheManager.readItem("accessToken"));
                },
                text: "read"),
          ],
        ),
        Text(
          L10n.of(context)!.welcomeBack,
          style: TextConstants.instance.heading4,
        ),
        Row(
          children: [
            Text(
              L10n.of(context)!.haventAnAccount,
              style: TextConstants.instance.subtitle1,
            ),
            CustomTextButton(
              onPressed: () {
                NavigationService.instance.navigateToPage(Routes.signup.name);
              },
              padding: EdgeInsets.zero,
              buttonSize: ButtonSize.small,
              hasUnderline: true,
              text: L10n.of(context)!.signup,
            )
          ],
        ),
      ],
    );
  }
}
