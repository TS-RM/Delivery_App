import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

class Counter extends StatelessWidget {
  const Counter({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 35.w,
        height: 30.h,
        decoration: BoxDecoration(
            color: mainColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
