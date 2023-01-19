import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../auth/auth_button.dart';

class ShowNotFound extends StatelessWidget {
  const ShowNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .6.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/notfound.png',
            width: 75.w,
            height: 75.h,
          ),
          SizedBox(
            height: 8.h,
          ),
          TextWithFont().textShow(
            text: 'Not Found'.tr,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: mainColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 35.h,
          ),
          TextWithFont().textShow(
              text: 'Thank you for using the app'.tr,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(147, 161, 170, 1),
              textAlign: TextAlign.center),
          SizedBox(
            height: 35.h,
          ),
          AuthButton(
            text: 'Back to Home'.tr,
            press: () {
              // Get.toNamed(ScreenName.mainScreen);
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
