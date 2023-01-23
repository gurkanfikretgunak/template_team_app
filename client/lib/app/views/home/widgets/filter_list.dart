import 'package:client/app/views/home/widgets/filter_list_viewmodel.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class FilterList extends StatelessWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> filterItemList = FilterListViewModel().filterItems(context);
    return SizedBox(
      height: context.dynamicHeight(0.05),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return context.emptySizedWidthBoxLow;
        },
        scrollDirection: Axis.horizontal,
        itemCount: filterItemList.length,
        itemBuilder: (context, index) {
          return filterItemList[index];
        },
      ),
    );
  }
}
