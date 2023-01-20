import 'package:client/app/views/auth/sign_in/sign_in.view.dart';
import 'package:client/app/views/auth/sign_up/sign_up.view.dart';
import 'package:client/app/views/auth/verification/forgot_password/forgot_password.view.dart';
import 'package:client/app/views/auth/verification/verify_otp/verify_otp.view.dart';
import 'package:client/app/views/booking_detail/booking_detail.view.dart';
import 'package:client/app/views/navigation/navigation.view.dart';
import 'package:client/app/views/onboarding/onboarding.view.dart';
import 'package:client/app/views/shop/shop.view.dart';
import 'package:client/app/routes/routes.dart';
import 'package:client/app/views/shop_detail/shop_detail.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._init();
  static final AppRoutes _instance = AppRoutes._init();
  static AppRoutes get instance => _instance;

  Route<dynamic> onGenerateRoute(RouteSettings args) {
    final routes = Routes.values.byName(args.name!);
    switch (routes) {
      case Routes.onboarding:
        return FadeTransitionPageRoute(const OnboardingView(), settings: args);

      case Routes.signin:
        return FadeTransitionPageRoute(const SignInView(), settings: args);

      case Routes.signup:
        return FadeTransitionPageRoute(const SignUpView(), settings: args);

      case Routes.verifyOtb:
        return FadeTransitionPageRoute(const VerifyOtbView(), settings: args);

      case Routes.forgotPassword:
        return FadeTransitionPageRoute(const ForgotPasswordView(),
            settings: args);

      case Routes.navigation:
        return FadeTransitionPageRoute(const NavigationView(false),
            settings: args);

      case Routes.shop:
        return FadeTransitionPageRoute(const ShopView(), settings: args);
      case Routes.shopDetail:
        return FadeTransitionPageRoute(const ShopDetailView(), settings: args);
      case Routes.bookingDetail:
        return FadeTransitionPageRoute(const BookingDetailView(false),
            settings: args);

      default:
        return MaterialPageRoute(
          builder: (context) => Text('No route defined for ${routes.name}'),
        );
    }
  }
}

class FadeTransitionPageRoute extends CupertinoPageRoute {
  final Widget widget;

  FadeTransitionPageRoute(this.widget, {RouteSettings? settings})
      : super(settings: settings, builder: (BuildContext context) => widget);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: widget);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 650);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    Animation<double> onlyForwardAnimation;
    switch (animation.status) {
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        onlyForwardAnimation = kAlwaysCompleteAnimation;
        break;
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        onlyForwardAnimation = animation;
        break;
    }
    return theme.buildTransitions(
        this, context, onlyForwardAnimation, secondaryAnimation, child);
  }
}
