// import 'package:client/app/l10n/app_l10n.dart';
// import 'package:client/app/routes/routes_widgets.dart';
// import 'package:client/app/views/auth/widgets/custom_social_icon.dart';
// import 'package:client/app/views/auth/widgets/social_image_path.dart';
// import 'package:client/app/widgets/buttons/buttons_widgets.dart';
// import 'package:client/app/widgets/divider/divider_widgets.dart';
// import 'package:client/app/widgets/image_viewer/icons/icons_widgets.dart';
// import 'package:client/core/base/base_view/base_view.dart';
// import 'package:client/core/constans/color_constants.dart';
// import 'package:client/core/extensions/common_extension.dart';
// import 'package:flutter/material.dart';

// import 'widgets/app_bar.dart';

// class CustomSignUpWith extends BaseView {
//   const CustomSignUpWith({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return baseBuild(
//       context,
//       appbar: PreferredSize(
//         preferredSize: const Size.fromHeight(160.0),
//         child: Container(
//           color: ColorConstant.instance.purple2,
//           child: const AppBarContent(),
//         ),
//       ),
//       body: Padding(
//         padding: context.onlyLRTBpaddingNormal,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               children: [
//                 CustomSocialIcon(
//                   imagePath: SocialPath.google,
//                   height: IconSize.large,
//                   width: IconSize.large,
//                   socialName: L10n.of(context)!.continueWithGoogle,
//                 ),
//                 CustomSocialIcon(
//                   imagePath: SocialPath.apple,
//                   height: IconSize.large,
//                   width: IconSize.large,
//                   socialName: L10n.of(context)!.continueWithApple,
//                 ),
//               ],
//             ),
//             Padding(
//               padding: context.verticalPaddingMedium,
//               child: Row(
//                 children: [
//                   const Expanded(child: CustomDivider()),
//                   Padding(
//                     padding: context.horizontalPaddingMedium,
//                     child: Text(L10n.of(context)!.or),
//                   ),
//                   const Expanded(child: CustomDivider()),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: context.dynamicWidth(1),
//               child: CustomElevatedButton(
//                 onPressed: () {
//                   NavigationService.instance.navigateToPage(Routes.signup.name);
//                 },
//                 text: L10n.of(context)!.signup,
//                 buttonSize: ButtonSize.large,
//                 buttonColor: ButtonColor.purple,
//                 textColor: ButtonColor.light,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
