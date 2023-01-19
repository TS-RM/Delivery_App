import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/enums/loading_types.dart';
import 'package:tashil_food_app/core/logic/controllers/search_controller.dart';
import 'package:tashil_food_app/presentation/widgets/search/list_tile_card.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/search/show_not_found.dart';

class SearchForMeal extends StatelessWidget {
  SearchForMeal({
    Key? key,
  }) : super(key: key);

  final searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loadingType =
          searchController.loadingStateProducts.value.loadingType;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            searchController.searchMealList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        controller: searchController.scrollControllerProducts,
                        physics: const BouncingScrollPhysics(),
                        itemCount: loadingType == LoadingType.loading ||
                                loadingType == LoadingType.error ||
                                loadingType == LoadingType.completed
                            ? searchController.searchMealList.length + 1
                            : searchController.searchMealList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final isLastItem =
                              index == searchController.searchMealList.length;
                          if (isLastItem &&
                              loadingType == LoadingType.loading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (isLastItem &&
                              loadingType == LoadingType.error) {
                            return Container();
                          } else if (isLastItem &&
                              loadingType == LoadingType.completed) {
                            return Text(
                              searchController
                                  .loadingStateProducts.value.completed
                                  .toString(),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  ScreenName.productDetailsScreen,
                                  arguments: [
                                    {
                                      'MealData':
                                          searchController.searchMealList[index]
                                    }
                                  ],
                                );
                              },
                              child: ListTileCard(
                                subtitleWidget: Row(
                                  children: [
                                    Image.asset('assets/images/fire.png'),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      '${searchController.searchMealList[index].calories}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .color!
                                              .withOpacity(.5)),
                                    ),
                                  ],
                                ),
                                dataMeals:
                                    searchController.searchMealList[index],
                                // dataRestaurant: DataRestaurant(),
                                isProduct: true,
                              ),
                            );
                          }
                        }))
                : const ShowNotFound(),
          ],
        ),
      );
    });
  }
}
