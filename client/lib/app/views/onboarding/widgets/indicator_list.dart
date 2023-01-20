import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:client/app/views/onboarding/widgets/indicator_item.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndicatorList extends StatelessWidget {
  const IndicatorList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingViewModel>(context);

    return SizedBox(
      width: context.dynamicWidth(1),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        children: <Widget>[
          IndicatorItem(
            positionIndex: 0,
            currentIndex: provider.currentIndex,
          ),
          IndicatorItem(
            positionIndex: 1,
            currentIndex: provider.currentIndex,
          ),
          IndicatorItem(
            positionIndex: 2,
            currentIndex: provider.currentIndex,
          ),
          IndicatorItem(
            positionIndex: 3,
            currentIndex: provider.currentIndex,
          ),
        ],
      ),
    );
  }
}
