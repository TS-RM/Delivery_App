import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.decoration,
  }) : super(key: key);
  final String decoration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ReadMoreText(
        decoration,
        trimLines: 2,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color:
              Theme.of(context).textTheme.headlineLarge!.color!.withOpacity(.5),
        ),
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        moreStyle: TextStyle(
          color: mainColor,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        lessStyle: TextStyle(
          color: mainColor,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
