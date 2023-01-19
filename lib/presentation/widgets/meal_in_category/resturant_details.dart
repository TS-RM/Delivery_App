// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tashil_food_app/constants/path_const/image_asset.dart';
// import 'package:tashil_food_app/constants/theme/theme_data.dart';
// import 'package:tashil_food_app/data/category/model/category_model.dart';
// import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
/// ! delete
// class RestaurantDetails extends StatelessWidget {
//   const RestaurantDetails({
//     Key? key,
//     required this.restaurantData,
//   }) : super(key: key);
//   final CategoryModel restaurantData;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             TextWithFont().textShow(
//                 color: Theme.of(context).textTheme.headlineLarge!.color!,
//                 fontSize: 20.sp,
//                 text: restaurantData.name!,
//                 fontWeight: FontWeight.bold),
//             SizedBox(
//               width: 5.w,
//             ),
//             TextWithFont().textShow(
//                 color: dateColor,
//                 fontSize: 14.sp,
//                 text: 'Open(${restaurantData.name} to ${restaurantData.name})',
//                 fontWeight: FontWeight.w500),
//           ],
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         Row(
//           children: [
//             Image.asset(
//               ImageAsset.loc,
//               width: 20.w,
//               height: 20.h,
//             ),
//             TextWithFont().textShow(
//                 color: Theme.of(context)
//                     .textTheme
//                     .headlineLarge!
//                     .color!
//                     .withOpacity(.5),
//                 fontSize: 16.sp,
//                 text: restaurantData.name!,
//                 fontWeight: FontWeight.w500),
//           ],
//         ),
//         SizedBox(
//           height: 10.h,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 5.w,
//             ),
//             TextWithFont().textShow(
//                 color: Theme.of(context)
//                     .textTheme
//                     .headlineLarge!
//                     .color!
//                     .withOpacity(.5),
//                 fontSize: 16.sp,
//                 text: restaurantData.name.toString(),
//                 fontWeight: FontWeight.w500),
//             RatingBarIndicator(
//               rating: 3.5,
//               itemCount: 1,
//               itemSize: 20.0,
//               physics: const BouncingScrollPhysics(),
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: mainColor,
//               ),
//             ),
//             SizedBox(
//               width: 16.w,
//             ),
//             TextWithFont().textShow(
//                 color: Theme.of(context)
//                     .textTheme
//                     .headlineLarge!
//                     .color!
//                     .withOpacity(.5),
//                 fontSize: 16.sp,
//                 text: '${restaurantData.name}+Rating',
//                 fontWeight: FontWeight.w500),
//             SizedBox(
//               width: 16.w,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
