import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/account/manage_address/manage_address.viewmodel.dart';
import 'package:client/app/views/account/manage_address/widgets/address_item.dart';
import 'package:client/app/views/account/manage_address/widgets/new_address_alert_dialog.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageAddressWidgets {
  CustomAppbar appbar(BuildContext context) {
    return CustomAppbar(title: L10n.of(context)!.manageAddress);
  }

  Widget body(BuildContext context) {
    final provider = Provider.of<ManageAddressViewModel>(context);

    List<Map> addressList = provider.addressList;
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          provider.addressList.isEmpty
              ? const Center(child: Text("Empty List"))
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: addressList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const CustomDivider(type: DividerType.dashed);
                  },
                  itemBuilder: (context, index) {
                    var key = addressList[index];
                    return AddressItem(
                      listItem: key,
                      index: index,
                    );
                  },
                ),
          SizedBox(
            width: context.dynamicWidth(1),
            child: CustomElevatedButton(
              onPressed: () {
                _showAlertDialog(context, isNewAddress: true);
              },
              text: L10n.of(context)!.newAddress,
              textColor: ButtonColor.light,
            ),
          )
        ],
      ),
    );
  }

  _showAlertDialog(BuildContext context, {required bool isNewAddress}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NewAddresAlertDialog(
          isNewAddress: isNewAddress,
        );
      },
    );
  }
}
