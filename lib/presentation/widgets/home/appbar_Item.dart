import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/presentation/widgets/home/text_field.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class AppBarItem extends StatelessWidget {
  const AppBarItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (() {
              Get.toNamed(ScreenName.searchScreen);
            }),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
              child: const HomeTextField(),
            ),
          ),
        ),
        GestureDetector(
          onTap: (() {
            Get.toNamed(ScreenName.notificatonScreen);
          }),
          child: Padding(
            padding: Get.locale?.languageCode == 'en'
                ? EdgeInsets.only(right: 25.w, left: 0)
                : EdgeInsets.only(right: 0, left: 25.w),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 30,
              color: Theme.of(context).textTheme.headlineLarge!.color,
            ),
          ),
        ),
      ],
    );
  }
}
