import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/enums/loading_types.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/meals_controller.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../widgets/AllFood/appbar_meal.dart';
import '../widgets/AllFood/meal_card.dart';

class AllFoodScreen extends GetView<MealsController> {
  const AllFoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarMeal(),
        body: Obx(() {
          final loadingType = controller.loadingState.value.loadingType;
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: controller.scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.75),
                      itemCount: loadingType == LoadingType.loading ||
                              loadingType == LoadingType.error ||
                              loadingType == LoadingType.completed
                          ? controller.allMeals.length + 1
                          : controller.allMeals.length,
                      itemBuilder: (context, index) {
                        final isLastItem = index == controller.allMeals.length;
                        if (isLastItem && loadingType == LoadingType.loading) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator.adaptive(),
                            ],
                          );
                        } else if (isLastItem &&
                            loadingType == LoadingType.error) {
                          return Container();
                        } else if (isLastItem &&
                            loadingType == LoadingType.completed) {
                          return Text(
                            controller.loadingState.value.completed.toString(),
                          );
                        } else {
                          return SizedBox(
                            height: 500,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  ScreenName.productDetailsScreen,
                                  arguments: [
                                    {'MealData': controller.allMeals[index]}
                                  ],
                                );
                              },
                              child: MealCard(
                                  homeProductData: controller.allMeals[index]),
                            ),
                          );
                        }
                      }),
                );
        }));
  }
}
