import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/presentation/widgets/home/time_onboarding.dart';

class OnboardingTime extends StatelessWidget {
  const OnboardingTime({
    Key? key,
    required this.deadline,
  }) : super(key: key);
  final String deadline;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.h,
      left: 40.w,
      child: Row(
        children: [
          TimeOnBoarding(
            text: DateTime.parse(deadline).day.toString(),
          ),
          SizedBox(
            width: 20.w,
          ),
          TimeOnBoarding(
            text: DateTime.parse(deadline).hour.toString(),
          ),
          SizedBox(
            width: 20.w,
          ),
          TimeOnBoarding(
            text: DateTime.parse(deadline).minute.toString(),
          ),
        ],
      ),
    );
  }
}
