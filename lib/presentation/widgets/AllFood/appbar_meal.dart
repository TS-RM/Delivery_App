import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/meals_controller.dart';
import 'package:tashil_food_app/presentation/widgets/AllFood/chose_menu.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

import '../category/chose_menu_rating.dart';
import '../search/filter/range_slider.dart';

final controller = Get.find<MealsController>();

class AppBarMeal extends StatelessWidget with PreferredSizeWidget {
  AppBarMeal({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextWithFont().textShow(
          text: 'All Meals'.tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.headlineLarge!.color),
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // Get.bottomSheet()
            appModalBottomSheet(context);
          },
          child: Padding(
            padding: Get.locale?.languageCode == 'en'
                ? EdgeInsets.only(right: 25.w, left: 0)
                : EdgeInsets.only(right: 0, left: 25.w),
            child: Icon(
              Icons.filter_alt_outlined,
              color: Theme.of(context).textTheme.headlineLarge!.color,
            ),
          ),
        )
      ],
    );
  }
}

void appModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    )),
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment:
                      SharedPref.instance.getString("curruntLang") == 'en'
                          ? Alignment.topRight
                          : Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {
                      controller.filterProduct(
                        category: controller
                            .allCategoriesList[controller.currentSelected.value]
                            .title!,
                        price: controller.currentSelectedSlider.value.toInt(),
                        rating: controller
                            .sizeList[controller.currentSelectedRating.value],
                        subcategory: 'subcategory1',
                      );
                    },
                    child: Text(
                      'Apply'.tr,
                      style: TextStyle(color: mainColor),
                    ),
                  ),
                ),
                TextWithFont().textShow(
                    color: Theme.of(context).textTheme.headlineLarge!.color!,
                    fontSize: 20.sp,
                    text: 'Categorys'.tr,
                    fontWeight: FontWeight.bold),
                ChoseMenu(),
                SizedBox(
                  height: 20.h,
                ),
                // TextWithFont().textShow(
                //     color: Theme.of(context).textTheme.headlineLarge!.color!,
                //     fontSize: 20.sp,
                //     text: 'Options'.tr,
                //     fontWeight: FontWeight.bold),
                // ChoseMenu(),
                // SizedBox(
                //   height: 20.h,
                // ),
                TextWithFont().textShow(
                    color: Theme.of(context).textTheme.headlineLarge!.color!,
                    fontSize: 20.sp,
                    text: 'Rating'.tr,
                    fontWeight: FontWeight.bold),
                ChoseMenuRating(),
                SizedBox(
                  height: 20.h,
                ),
                RangeSliderFlitter(),
                SizedBox(
                  height: 70.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
