import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/widgets/inputs/widgets/radio_button/custom_radio_button.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationAlertDialog extends StatelessWidget {
  const LocationAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
      content: SingleChildScrollView(
        child: SizedBox(
          width: context.dynamicWidth(1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              CustomRadioButton(
                list: provider.locationList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
