import 'package:client/app/views/booking_detail/booking_detail.viewmodel.dart';
import 'package:client/app/views/filter_bottom_sheet/filter_bottom_sheet.viewmodel.dart';
import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/widgets/bottom_bar/bottom_bar.viewmodel.dart';
import 'package:client/app/widgets/inputs/widgets/check_box/check_box_notifier.dart';
import 'package:client/app/widgets/inputs/widgets/drop_down/dropdown_button_notifier.dart';
import 'package:client/app/widgets/inputs/widgets/radio_button/radio_button_notifier.dart';
import 'package:client/app/widgets/inputs/widgets/search_field/search_field_notification.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MultiProviderInit {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => CheckboxNotifier()),
    ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
    ChangeNotifierProvider(create: (_) => BottomNavBarViewModel()),
    ChangeNotifierProvider(create: (_) => DropDownButtonNotifier()),
    ChangeNotifierProvider(create: (_) => RadioButtonNotifier()),
    ChangeNotifierProvider(create: (_) => BookingDetailViewModel()),
    ChangeNotifierProvider(create: (_) => SearchFieldNotifier()),
    ChangeNotifierProvider(create: (_) => FilterBottomSheetViewModel()),
  ];
}
