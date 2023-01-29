import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/onboarding_controller.dart';
import 'package:tashil_food_app/data/settings/service/settings_service.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class OnBoardingRow extends StatelessWidget {
  const OnBoardingRow({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Get.offAndToNamed(ScreenName.mainScreen);
              SettingsService().addSplashData();
            },
            child: TextWithFont().textShow(
              text: 'Skip'.tr,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: GestureDetector(
              onTap: () {
                controller.next();
              },
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.orange.withOpacity(.07),
                child: TextWithFont().textShow(
                  text: 'Next'.tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: mainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
