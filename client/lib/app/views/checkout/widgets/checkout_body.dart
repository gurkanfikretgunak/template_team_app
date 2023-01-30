import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../routes/navigation_service.dart';
import '../../../routes/routes.dart';
import '../../../widgets/buttons/widgets/checkout_button.dart';
import '../checkout.widgets.dart';

class CheckoutBodyWidget extends StatefulWidget {
  const CheckoutBodyWidget({super.key, required this.isBookingEdit});
  final bool isBookingEdit;
  @override
  State<CheckoutBodyWidget> createState() => _CheckoutBodyWidgetState();
}

class _CheckoutBodyWidgetState extends State<CheckoutBodyWidget> {
  final ScrollController scrollController = ScrollController(); // set controller on scrolling
  bool _show = false;
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    handleScroll();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    super.dispose();
  }

  void showFloationButton() {
    setState(() {
      _show = false;
    });
  }

  void hideFloationButton() {
    setState(() {
      _show = true;
    });
  }

  void handleScroll() async {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        hideFloationButton();
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        showFloationButton();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CheckoutWidgets().body(context, scrollController, widget.isBookingEdit),
        Visibility(
            visible: _show,
            child: CheckoutButton(
              itemCount: 2,
              totalPrice: 449,
              onPressed: () => NavigationService.instance.navigateToPage(Routes.checkout.name),
            ))
      ],
    );
  }
}
