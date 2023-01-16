import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/widgets/bottom_bar/bottom_bar.viewmodel.dart';
import 'package:client/app/widgets/inputs/widgets/check_box/custom_check_box.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MultiProviderInit {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => CheckboxNotifier()),
    ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
    ChangeNotifierProvider(create: (_) => BottomNavBarViewModel()),
  ];
}
