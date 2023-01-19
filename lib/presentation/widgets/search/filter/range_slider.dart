import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/meals_controller.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class RangeSliderFlitter extends StatelessWidget {
  final mealsController = Get.find<MealsController>();

  RangeSliderFlitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWithFont().textShow(
                    color: Theme.of(context).textTheme.headlineLarge!.color!,
                    fontSize: 20.sp,
                    text: 'Price Range'.tr,
                    fontWeight: FontWeight.bold),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$ ${mealsController.startLabel.value}',
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 12),
                    ),
                    Text(" - ", style: TextStyle(color: Colors.grey.shade500)),
                    Text(
                      '\$ ${mealsController.endLabel.value}',
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 12),
                    ),
                  ],
                ),
              ],
            )),
        SizedBox(
          height: 30.h,
        ),
        Obx(() => RangeSlider(
            values: mealsController.values.value,
            min: 0.00,
            max: 100.00,
            divisions: 10,
            inactiveColor: Colors.grey.shade300,
            activeColor: mainColor,
            labels: RangeLabels(
              '\$ ${mealsController.startLabel.value}',
              '\$ ${mealsController.endLabel.value}',
            ),
            onChanged: (RangeValues values) {
              mealsController.values.value = values;
              mealsController.currentSelectedSlider.value =
                  values.end - values.start;
              mealsController.startLabel.value = values.start.toString();
              mealsController.endLabel.value = values.end.toString();
            })),
      ],
    );
  }
}
