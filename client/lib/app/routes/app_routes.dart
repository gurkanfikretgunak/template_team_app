import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/account/payments/payment_home/payment.view.dart';
import 'package:client/app/views/beauty_service_detail/beauty_service_detail.view.dart';
import 'package:client/app/views/checkout/checkout.view.dart';
import 'package:client/app/views/checkout_detail/checkout_detail.view.dart';
import 'package:client/app/views/home/see_all_near/see_all.view.dart';
import 'package:client/app/views/permission/permission.view.dart';
import 'package:client/app/views/promo/promo.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/search/search.view.dart';

class AppRoutes {
  AppRoutes._init();
  static final AppRoutes _instance = AppRoutes._init();
  static AppRoutes get instance => _instance;

  Route<dynamic> onGenerateRoute(RouteSettings args) {
    final routes = Routes.values.byName(args.name!);
    switch (routes) {
      case Routes.onboarding:
        return FadeTransitionPageRoute(const OnboardingView(), settings: args);

      case Routes.permission:
        return FadeTransitionPageRoute(const PermissionView(), settings: args);

      case Routes.signin:
        return FadeTransitionPageRoute(const SignInView(), settings: args);

      case Routes.signup:
        return FadeTransitionPageRoute(const SignUpView(), settings: args);

      case Routes.verifyOtb:
        return FadeTransitionPageRoute(const VerifyOtbView(), settings: args);

      case Routes.forgotPassword:
        return FadeTransitionPageRoute(const ForgotPasswordView(),
            settings: args);

      case Routes.search:
        return FadeTransitionPageRoute(const SearchView(false), settings: args);

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

      case Routes.manageAddress:
        return FadeTransitionPageRoute(const ManageAddressView(false),
            settings: args);

      case Routes.favorites:
        return FadeTransitionPageRoute(const FavoritesView(false),
            settings: args);

      case Routes.payment:
        return FadeTransitionPageRoute(const PaymentView(false),
            settings: args);

      case Routes.notification:
        return FadeTransitionPageRoute(const SizedBox(), settings: args);

      case Routes.about:
        return FadeTransitionPageRoute(const AboutView(false), settings: args);

      case Routes.checkout:
        return FadeTransitionPageRoute(const CheckoutView(false, false),
            settings: args);
      case Routes.popularNearDetail:
        return FadeTransitionPageRoute(const SeeAllNearView(), settings: args);

      case Routes.checkoutDetail:
        return FadeTransitionPageRoute(const CheckoutDetailView(false),
            settings: args);

      case Routes.promo:
        return FadeTransitionPageRoute(const PromoView(false), settings: args);

      case Routes.addCard:
        return FadeTransitionPageRoute(const AddCardView(false),
            settings: args);

      case Routes.beautyServiceDetail:
        return FadeTransitionPageRoute(const BeautyServiceDetailView(false),
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
