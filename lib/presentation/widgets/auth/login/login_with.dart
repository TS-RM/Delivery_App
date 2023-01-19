import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/auth/login/line_widget.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class LoginWithText extends StatelessWidget {
  const LoginWithText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Get.locale?.languageCode == 'en'
            ? LineWidget(left: 0.0, right: 30.w)
            : LineWidget(left: 30.w, right: 0),
        TextWithFont().textShow(
          text: "Login with".tr,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).iconTheme.color,
        ),
        Get.locale?.languageCode == 'en'
            ? LineWidget(left: 30.w, right: 0.0)
            : LineWidget(left: 0, right: 30.w),
      ],
    );
  }
}
