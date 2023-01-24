import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/home/home.widgets.dart';
import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/image_viewer/icons/widgets/custom_icons.dart';
import 'package:client/app/widgets/inputs/widgets/search_field/search_field_notification.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constans/color_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../../../l10n/app_l10n.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/image_viewer/icons/widgets/icon_size.dart';
import '../../../widgets/inputs/widgets/text_fields/custom_text_form_field.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late String _search;

  List<Map<String, dynamic>> _mockDatas(BuildContext context) {
    return [
      {
        " id": 1,
        "image": "assets/images/shop/shop_detail_1.png",
        "name": L10n.of(context)!.haircutForMen,
        "age": " ${L10n.of(context)!.resultSearch}"
      },
      {
        " id": 2,
        "image": "assets/images/shop/shop_detail_1.png",
        "name": L10n.of(context)!.haircutForMen,
        "age": " ${L10n.of(context)!.resultSearch}"
      },
      {
        " id": 3,
        "image": "assets/images/shop/shop_detail_1.png",
        "name": L10n.of(context)!.facialForWomen,
        "age": " ${L10n.of(context)!.resultSearch}"
      },
      {
        " id": 4,
        "image": "assets/images/shop/shop_detail_1.png",
        "name": L10n.of(context)!.bleachForWomen,
        "age": " ${L10n.of(context)!.resultSearch}"
      },
    ];
  }

  List<Map<String, dynamic>> _foundUsers = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _mockDatas(context);
    } else {
      results = _mockDatas(context)
          .where((user) => user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  Future<void> readySharedPreferences() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    _search = sharedPreferences.getString("search");
    setState(() {});
  }

  Future<void> saveData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    _search = SearchFieldNotifier().searchController.text;
    sharedPreferences.setString("search", _search);
  }

  @override
  void initState() {
    super.initState();
    readySharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchFieldNotifier>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Padding(
          padding: context.onlyTopPaddingMedium,
          child: CustomAppbar(title: L10n.of(context)!.search),
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
                child: Padding(
              padding: context.onlyTopPaddingNormal,
              child: ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopView()));
                          },
                          child: Card(
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
                        ),
                        const CustomDivider(
                          type: DividerType.normal,
                        )
                      ],
                    );
                  }),
            )),
          ],
        ),
      ),
    );
  }
}
