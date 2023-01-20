import 'package:client/app/views/auth/verification/verify_otp/verify_otp.viewmodel.dart';
import 'package:client/app/views/booking_detail/booking_detail.viewmodel.dart';
import 'package:client/app/views/bookings/bookings.viewmodel.dart';
import 'package:client/app/views/filter_bottom_sheet/filter_bottom_sheet.viewmodel.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/gender/gender_notifier.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/views/navigation/navigation.viewmodel.dart';
import 'package:client/app/views/filter_bottom_sheet/widgets/timing/timing_notifier.dart';
import 'package:client/app/views/shop_detail/shop_detail.viewmodel.dart';
import 'package:client/app/widgets/inputs/widgets/radio_button/radio_button_notifier.dart';
import 'package:client/app/widgets/inputs/widgets/search_field/search_field_notification.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MultiProviderInit {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => TimingNotifier()),
    ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
    ChangeNotifierProvider(create: (_) => BottomNavBarViewModel()),
    ChangeNotifierProvider(create: (_) => RadioButtonNotifier()),
    ChangeNotifierProvider(create: (_) => BookingDetailViewModel()),
    ChangeNotifierProvider(create: (_) => SearchFieldNotifier()),
    ChangeNotifierProvider(create: (_) => FilterBottomSheetViewModel()),
    ChangeNotifierProvider(create: (_) => GenderNotifier()),
    ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ChangeNotifierProvider(create: (_) => BookingViewModel()),
    ChangeNotifierProvider(create: (_) => VerifyOtpViewModel()),
    ChangeNotifierProvider(create: (_) => ShopDetailViewModel()),
  ];
}
