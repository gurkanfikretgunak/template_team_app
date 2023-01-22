import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/account_home/account.viewmodel.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/image_viewer/custom_viewer_image.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AccountWidgets {
  appBar(BuildContext context) {
    return CustomAppbar(
      specialAppbar: Wrap(
        children: [
          ListTile(
            visualDensity: const VisualDensity(vertical: 3),
            leading: CustomImageViewer(
              assetPath: Assets.images.profilPhoto.path,
            ),
            title: Text("John Doe", style: TextConstants.instance.heading6),
            subtitle: const Text("+1 - 4842989351   johndoe@gmail.com"),
            trailing: CustomTextButton(
                onPressed: () {}, text: L10n.of(context)!.edit),
          ),
          const CustomDivider()
        ],
      ),
    );
  }

  body(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingNormal,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: AccountViewModel().accountItems(context).length,
        itemBuilder: (context, index) {
          var key = AccountViewModel().accountItems(context)[index];
          return InkWell(
            onTap: key['onTap'],
            child: ListTile(
              leading: Icon(key['icon'],
                  color: buildItemColor(context, key['title'])),
              title: Text(key['title'],
                  style: TextConstants.instance.button1
                      .copyWith(color: buildItemColor(context, key['title']))),
              subtitle: Text(key['subTitle']),
              trailing: Icon(Icons.arrow_forward_ios_outlined,
                  size: 15, color: buildItemColor(context, key['title'])),
            ),
          );
        },
      ),
    );
  }

  buildItemColor(BuildContext context, title) {
    return (title == L10n.of(context)!.logout)
        ? ColorConstant.instance.red0
        : ColorConstant.instance.dark0;
  }
}
