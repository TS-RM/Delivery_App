import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/settings/service/settings_service.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../auth/auth_button.dart';

class OnBoardingColumn extends StatelessWidget {
  const OnBoardingColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthButton(
          press: () {
            Get.toNamed(ScreenName.mainScreen);
            SettingsService().addSplashData();
          },
          text: 'Get Start'.tr,
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I already have an account. '.tr,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).textTheme.headlineLarge!.color),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(ScreenName.loginScreen);
              },
              child: TextWithFont().textShow(
                text: "Log in".tr,
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
                color: headlineLargeColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
