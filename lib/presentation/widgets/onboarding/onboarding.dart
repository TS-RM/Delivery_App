import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/data_show/example.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class PageViewOnBoarding extends StatelessWidget {
  final int index;

  const PageViewOnBoarding({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35.h,
        ),
        Image.asset(
          onBoardingList[index].image!,
          height: 262.h,
          width: 312.06.w,
        ),
        Get.locale?.languageCode == 'en'
            ? SizedBox(
                height: 40.h,
              )
            : SizedBox(
                height: 20.h,
              ),
        TextWithFont().textShow(
            text: onBoardingList[index].title!.tr,
            fontSize: 28.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: mainColor),
        SizedBox(
          height: 30.h,
        ),
        TextWithFont().textShow(
          text: onBoardingList[index].body!,
          fontSize: 18.sp,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).textTheme.titleLarge!.color,
        )
      ],
    );
  }
}
