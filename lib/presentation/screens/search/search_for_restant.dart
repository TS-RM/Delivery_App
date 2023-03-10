// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:tashil_food_app/constants/enums/loading_types.dart';
// import 'package:tashil_food_app/core/logic/controllers/search_controller.dart';
// import 'package:tashil_food_app/data/model/search/search_Model.dart';
// import 'package:tashil_food_app/presentation/widgets/search/listTileCard.dart';
// import 'package:tashil_food_app/routes/screen_name.dart';

// import '../../widgets/search/showNotFound.dart';
// import '../../widgets/textWithFont.dart';

// class SearchForRestrant extends StatelessWidget {
//   SearchForRestrant({
//     Key? key,
//   }) : super(key: key);

//   final searchController = Get.find<SearchController>();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final loadingType =
//           searchController.loadingStateRestaurant.value.loadingType;

//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 30.h,
//             ),
//             searchController.searchRestaurantList.isNotEmpty
//                 ? Expanded(
//                     child: ListView.builder(
//                         controller: searchController.scrollControllerRestaurant,
//                         physics: const BouncingScrollPhysics(),
//                         itemCount: loadingType == LoadingType.loading ||
//                                 loadingType == LoadingType.error ||
//                                 loadingType == LoadingType.completed
//                             ? searchController.searchRestaurantList.length + 1
//                             : searchController.searchRestaurantList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           final isLastItem = index ==
//                               searchController.searchMealList.length;
//                           if (isLastItem &&
//                               loadingType == LoadingType.loading) {
//                             return Center(
//                               child: CircularProgressIndicator.adaptive(),
//                             );
//                           } else if (isLastItem &&
//                               loadingType == LoadingType.error) {
//                             return Container();
//                           } else if (isLastItem &&
//                               loadingType == LoadingType.completed) {
//                             return Text(
//                               searchController
//                                   .loadingStateProducts.value.completed
//                                   .toString(),
//                             );
//                           } else {
//                             return GestureDetector(
//                                 onTap: () {
//                                   Get.toNamed(ScreenName.resturantScreen,
//                                       arguments: [
//                                         {
//                                           "id": searchController
//                                               .searchRestaurantList[index].id
//                                               .toString(),
//                                         }
//                                       ]);
//                                 },
//                                 child: ListTileCard(
//                                   subtitleWidget: TextWithFont()
//                                       .textWithRalewayFont(
//                                           color: Colors.black.withOpacity(.5),
//                                           fontSize: 16.sp,
//                                           text:
//                                               '${searchController.searchRestaurantList[index].address}',
//                                           fontWeight: FontWeight.w500),
//                                   dataProducts: DataProducts(),
//                                   dataRestaurant: searchController
//                                       .searchRestaurantList[index],
//                                   isProduct: false,
//                                 ));
//                           }
//                         }))
//                 : ShowNotFound(),
//           ],
//         ),
//       );
//     });
//   }
// }
