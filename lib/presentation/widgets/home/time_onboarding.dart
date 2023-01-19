import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class TimeOnBoarding extends StatelessWidget {
  final String text;
  const TimeOnBoarding({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white.withOpacity(.9),
      ),
      child: Center(
        child: TextWithFont().textShow(
            text: text,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            textAlign: TextAlign.center),
      ),
    );
  }
}
