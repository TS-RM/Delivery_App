import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/category_page_controller.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/meal_in_category/app_bar.dart';
import '../../widgets/meal_in_category/card_meal.dart';
import '../../widgets/meal_in_category/image_res.dart';

class RestaurantScreen extends GetView<CategoryPageController> {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarRes(),
      body: Obx(() {
        return controller.loading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset('assets/5.png'),
                    ImageRes(
                      imageUrl: controller.restaurantData.value.logo,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      children: [
                        TextWithFont().textShow(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color!,
                            fontSize: 20.sp,
                            text: controller.restaurantData.value.name!,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.count.value.toString(),
                              style: TextStyle(
                                letterSpacing: 0.5,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color
                                    ?.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Meals".tr,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Divider(
                      thickness: 1.h,
                      color: Colors.grey.shade400.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    controller.mealModel.isNotEmpty
                        ? Expanded(
                            flex: 3,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.mealModel.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    ScreenName.productDetailsScreen,
                                    arguments: [
                                      {'MealData': controller.mealModel[index]}
                                    ],
                                  );
                                },
                                child: CardRes(
                                  mealModel: controller.mealModel.value[index],
                                ),
                              ),
                            ),
                          )
                        : Text(
                            'No meals To Category'.tr,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            ),
                          ),
                  ],
                ),
              );
      }),
    );
  }
}
