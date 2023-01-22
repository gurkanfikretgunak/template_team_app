import 'package:client/app/views/account/about/about.viewmodel.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:flutter/material.dart';

class AboutWidgets {
  body(BuildContext context) {
    return ListView.builder(
      itemCount: AboutViewModel().accountItems(context).length,
      itemBuilder: (context, index) {
        var key = AboutViewModel().accountItems(context)[index];
        return InkWell(
          onTap: () {
            key['onTap'];
          },
          child: ListTile(
            leading: Text(
              key['title'],
              style: TextConstants.instance.label1,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
          ),
        );
      },
    );
  }
}
