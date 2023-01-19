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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWithFont().textShow(
              color: Theme.of(context).textTheme.headlineLarge!.color!,
              fontSize: 28.sp,
              text: 'Login'.tr,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Good to see you back!'.tr,
            style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).textTheme.headlineLarge!.color!,
            ),
          ),
        ],
      ),
    );
  }
}
