import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        child: TextWithFont().textShow(
          color: mainColor,
          fontSize: 15.sp,
          text: 'Forgot Password?'.tr,
          fontWeight: FontWeight.w300,
        ),
        onPressed: () {
          Get.toNamed(ScreenName.forgotPasswordScreen);
        },
      ),
    );
  }
}
