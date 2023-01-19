import 'package:client/app/views/auth/sign_in/sign_in.view.dart';
import 'package:client/app/views/auth/sign_up/sign_up.view.dart';
import 'package:client/app/views/auth/verification/forgot_password/forgot_password.view.dart';
import 'package:client/app/views/auth/verification/verify_otp/verify_otp.view.dart';
import 'package:client/app/views/booking_detail/booking_detail.view.dart';
import 'package:client/app/views/navigation/navigation.view.dart';
import 'package:client/app/views/onboarding/onboarding.view.dart';
import 'package:client/app/views/shop/shop.view.dart';
import 'package:client/core/init/routes/routes.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._init();
  static final AppRoutes _instance = AppRoutes._init();
  static AppRoutes get instance => _instance;

  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final routes = Routes.values.byName(routeSettings.name!);
    switch (routes) {
      case Routes.onboarding:
        return navigate(const OnboardingView());
      case Routes.signin:
        return navigate(const SignInView());
      case Routes.signup:
        return navigate(const SignUpView());
      case Routes.forgotPassword:
        return navigate(const ForgotPasswordView());
      case Routes.verifyOtb:
        return navigate(const VerifyOtbView());
      case Routes.navigation:
        return navigate(const NavigationView(false));
      case Routes.shop:
        return navigate(const ShopView());
      case Routes.bookingDetail:
        return navigate(const BookingDetailView(false));
      default:
        return navigate(
          Text('No route defined for ${routes.name}'),
        );
    }
  }

  Route<dynamic> navigate(Widget child) {
    return MaterialPageRoute(
      builder: (context) {
        return child;
      },
    );
  }
}
