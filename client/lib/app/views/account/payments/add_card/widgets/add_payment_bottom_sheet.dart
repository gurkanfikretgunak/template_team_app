import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

import '../add_Card.viewmodel.dart';

class AddPaymentBottomSheet extends StatelessWidget {
  const AddPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          L10n.of(context)!.addPaymentMehod,
          style: TextConstants.instance.heading6,
        ),
        ListView.builder(
          itemCount: AddCardViewModel().accountItems(context).length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var key = AddCardViewModel().accountItems(context)[index];

            return InkWell(
              onTap: key['onTap'],
              child: ListTile(
                leading: CustomIcon(
                  imagePath: key['icon'],
                  height: IconSize.large,
                  width: IconSize.large,
                ),
                title: Text(key['title']),
                trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 14),
              ),
            );
          },
        ),
        SizedBox(
          width: context.dynamicWidth(1),
          child: CustomElevatedButton(
            onPressed: () {
              NavigationService.instance.navigateToPage(Routes.addCard.name);
            },
            text: L10n.of(context)!.addCard,
            textColor: ButtonColor.light,
          ),
        )
      ],
    );
  }
}
