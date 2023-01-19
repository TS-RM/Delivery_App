import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.onClick,
  });

  final String imageUrl;
  final String text;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              width: 25.w,
              height: 25.h,
              color: mainColor,
            ),
            SizedBox(
              height: 15.h,
            ),
            TextWithFont().textShow(
                color: Theme.of(context).textTheme.headlineLarge!.color,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                text: text),
          ],
        ),
      ),
    );
  }
}
