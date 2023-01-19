import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'I already have an account. '.tr,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).textTheme.headlineLarge!.color!,
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(ScreenName.loginScreen);
          },
          child: Text(
            'Log in'.tr,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: headlineLargeColor,
            ),
          ),
        ),
      ],
    );
  }
}
