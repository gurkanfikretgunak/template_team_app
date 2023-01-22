import 'package:client/app/views/home/home.widgets.dart';
import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/custom_icons.dart';
import 'package:client/app/widgets/inputs/widgets/search_field/custom_search_field.dart';
import 'package:client/app/widgets/inputs/widgets/search_field/search_field_notification.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constans/color_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../../../l10n/app_l10n.dart';
import '../../../widgets/image_viewer/icons/widgets/icon_size.dart';
import '../../../widgets/inputs/widgets/text_fields/custom_text_form_field.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final List<Map<String, dynamic>> _mockDatas = [
    {" id": 1, "image": "assets/images/shop/shop_detail_1.png", "name": "Haircut for Men", "age": "122 Result"},
    {" id": 2, "image": "assets/images/shop/shop_detail_1.png", "name": "Haircut for Women", "age": "122 Result"},
    {" id": 3, "image": "assets/images/shop/shop_detail_1.png", "name": "Mika Salon", "age": "122 Result"},
    {" id": 4, "image": "assets/images/shop/shop_detail_1.png", "name": "Spa for Women", "age": "122 Result"},
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _mockDatas;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _mockDatas;
    } else {
      results = _mockDatas.where((user) => user["name"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchFieldNotifier>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: SafeArea(
          child: Row(
            children: [
              BackButton(
                color: ColorConstant.instance.dark0,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              HomeWidgets().appbar(context),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 400,
              child: CustomTextFormField(
                  hintText: L10n.of(context)!.search,
                  onChanged: (value) => _runFilter(value),
                  controller: provider.searchController,
                  prefixIcon: IconButton(
                    onPressed: null,
                    icon: CustomIcon(
                      imagePath: Assets.icons.search.path,
                      iconColor: ColorConstant.instance.purple2,
                      height: IconSize.medium,
                      width: IconSize.medium,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      provider.searchController.clear();
                    },
                    icon: CustomIcon(
                      imagePath: Assets.icons.close.path,
                      iconColor: ColorConstant.instance.purple2,
                      height: IconSize.medium,
                      width: IconSize.medium,
                    ),
                  )),
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? Padding(
                      padding: context.onlyTopPaddingNormal,
                      child: ListView.builder(
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Card(
                                  elevation: 0,
                                  key: ValueKey(_foundUsers[index]["id"]),
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      child: Image.asset(
                                        _foundUsers[index]["image"],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    title: Text(
                                      _foundUsers[index]['name'],
                                      style: TextConstants.instance.button1,
                                    ),
                                    subtitle: Text(_foundUsers[index]["age"].toString()),
                                  ),
                                ),
                                const CustomDivider(
                                  type: DividerType.normal,
                                )
                              ],
                            );
                          }),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
