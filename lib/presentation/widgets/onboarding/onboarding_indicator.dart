import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/onboarding_controller.dart';
import 'package:tashil_food_app/data/data_show/example.dart';

class OnBoardingIndicator extends StatelessWidget {
  OnBoardingIndicator({
    required this.controller,
    required this.margin,
  });

  final OnBoardingController controller;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                margin: EdgeInsets.only(right: margin),
                duration: const Duration(milliseconds: 900),
                width: 10.w,
                // controller.currentIndex.value== index?6.w:
                height: 10.h,
                decoration: BoxDecoration(
                    color: controller.currentIndex.value == index
                        ? mainColor
                        : onBoardingIndicatorColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ));
  }
}
