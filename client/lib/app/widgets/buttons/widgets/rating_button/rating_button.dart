import 'package:client/app/views/filter_bottom_sheet/filter_bottom_sheet.view.dart';
import 'package:client/app/widgets/buttons/widgets/rating_button/widgets/background_container.dart';
import 'package:client/app/widgets/buttons/widgets/rating_button/widgets/foreground_container.dart';
import 'package:client/core/base/base_view/base_view.dart';
import 'package:flutter/material.dart';

class RatingButton extends BaseView {
  const RatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bottomSheet(context);
      },
      child: Stack(
        children: const [
          BackgroundContainer(),
          ForegroundContainer(),
        ],
      ),
    );
  }

  bottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const FilterBottomSheet();
      },
    );
  }
}
