import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/widgets/image_viewer/custom_viewer_image.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class ServicesGridView extends StatelessWidget {
  const ServicesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPage(Routes.shop.name);
      },
      child: GridView.builder(
        itemCount: HomeViewModel().beautyServiceList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: context.lowValue,
          crossAxisSpacing: context.lowValue,
        ),
        itemBuilder: (context, index) {
          var key = HomeViewModel().beautyServiceList[index];

          return Center(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 2,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      border: Border.all(
                          width: 2, color: ColorConstant.instance.purple2),
                    ),
                    child: CustomImageViewer(assetPath: key['image'])),
                Text(
                  key['text'],
                  style: TextConstants.instance.subtitle1.copyWith(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
