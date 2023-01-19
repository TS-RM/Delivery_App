import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWithFont().textShow(
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
            text: 'I already have an account. '.tr,
            color: mainColor),
        InkWell(
          onTap: () {
            Get.toNamed(ScreenName.loginScreen);
          },
          child: TextWithFont().textShow(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              text: 'Login'.tr,
              color: headlineLargeColor),
        ),
      ],
    );
  }
}
