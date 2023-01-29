import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/meals_controller.dart';

class ChoseMenuRating extends StatelessWidget {
  final mealsController = Get.find<MealsController>();

  ChoseMenuRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              mealsController.currentSelectedRating.value = index;
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: mealsController.currentSelectedRating.value == index
                    ? mainColor
                    : Theme.of(context).textTheme.headlineMedium!.color,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: mainColor.withOpacity(0.4),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    mealsController.sizeList[index].toString(),
                    style: TextStyle(
                        color:
                            mealsController.currentSelectedRating.value == index
                                ? Colors.white
                                : Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color!
                                    .withOpacity(.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 243, 192, 71),
                    size: 18,
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: mealsController.sizeList.length,
      ),
    );
  }
}
