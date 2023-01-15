import 'package:client/app/widgets/icons/icons_widgets.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      this.leadingIcon,
      this.title,
      this.subtitle,
      this.hasLeadingIcon = false});
  final bool hasLeadingIcon;
  final String? leadingIcon;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: hasLeadingIcon
          ? CustomMaxIcon(
              imagePath: leadingIcon ?? '../assets/icons/placeholder.png')
          : null,
      title: Text(title ?? 'Title'),
      subtitle: Text(subtitle ?? 'Subtext'),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
