import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/core/logic/controllers/onboarding_controller.dart';
import 'package:tashil_food_app/data/data_show/example.dart';
import 'package:tashil_food_app/presentation/widgets/onboarding/onboarding_column.dart';
import 'package:tashil_food_app/presentation/widgets/onboarding/onboarding_indicator.dart';
import 'package:tashil_food_app/presentation/widgets/onboarding/onboarding_row.dart';

import '../widgets/OnBoarding/onBoarding.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.onPageChanged(value);
                },
                itemCount: onBoardingList.length,
                itemBuilder: (context, i) => PageViewOnBoarding(
                  index: i,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  OnBoardingIndicator(
                    controller: controller,
                    margin: 15,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  controller.currentIndex.value != 2
                      ? OnBoardingRow(controller: controller)
                      : const OnBoardingColumn(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
