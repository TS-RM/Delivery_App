import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWithFont().textShow(
              color: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .color!
                  .withOpacity(.8),
              fontSize: 16.sp,
              text: "Order Details ".tr,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}
