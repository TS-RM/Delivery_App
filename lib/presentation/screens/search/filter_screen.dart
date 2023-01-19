import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/resturant_controller.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/category/chose_menu.dart';
import '../../widgets/category/chose_menu_rating.dart';
import '../../widgets/search/filter/filter_app_bar.dart';
import '../../widgets/search/filter/range_slider.dart';
import 'package:get/get.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  final currentSeletected = 0;
  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const FilterAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWithFont().textShow(
                color: filterTitlesColor,
                fontSize: 20.sp,
                text: 'Category',
                fontWeight: FontWeight.bold),
            const ChoseMenu(),
            SizedBox(
              height: 20.h,
            ),
            TextWithFont().textShow(
                color: filterTitlesColor,
                fontSize: 20.sp,
                text: 'Type',
                fontWeight: FontWeight.bold),
            const ChoseMenu(),
            SizedBox(
              height: 20.h,
            ),
            TextWithFont().textShow(
                color: filterTitlesColor,
                fontSize: 20.sp,
                text: 'Rating',
                fontWeight: FontWeight.bold),
            ChoseMenuRating(),
            SizedBox(
              height: 20.h,
            ),
            RangeSliderFlitter(),
            SizedBox(
              height: 70.h,
            ),
            AuthButton(
              text: 'Apply Filter',
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
