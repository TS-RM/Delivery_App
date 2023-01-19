import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextWithFont().textShow(
          color: Theme.of(context).textTheme.headlineLarge!.color,
          fontSize: 20.sp,
          text: 'Creat a new account'.tr,
          fontWeight: FontWeight.bold),
    );
  }
}
