import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class ReviewProduct extends StatelessWidget {
  const ReviewProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextWithFont().textShow(
          color: Theme.of(context).textTheme.headlineLarge!.color!,
          fontSize: 15.sp,
          text: 'Product Reviews'.tr,
          fontWeight: FontWeight.bold),
    );
  }
}
