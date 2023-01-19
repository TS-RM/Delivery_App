import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextWithFont().textShow(
          color: Theme.of(context).textTheme.headlineLarge!.color!,
          fontSize: 20.sp,
          text: title,
          fontWeight: FontWeight.bold),
    );
  }
}
