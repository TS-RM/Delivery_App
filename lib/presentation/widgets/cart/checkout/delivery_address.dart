import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextWithFont().textShow(
          color:
              Theme.of(context).textTheme.headlineLarge!.color!.withOpacity(.5),
          fontSize: 16.sp,
          text: "Delivery Address".tr,
          fontWeight: FontWeight.w500),
    );
  }
}
