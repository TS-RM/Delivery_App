import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

import '../text_with_font.dart';

class SupTitle extends StatelessWidget {
  const SupTitle({
    Key? key,
    required this.supTitle,
    required this.price,
    required this.cal,
  }) : super(key: key);
  final String supTitle;
  final String price;
  final String cal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWithFont().textShow(
              color: Theme.of(context).textTheme.headlineLarge!.color!,
              fontSize: 12.sp,
              text: supTitle,
              fontWeight: FontWeight.w500),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "\$$price",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset(
                        'assets/images/fir.png',
                        alignment: Alignment.topCenter,
                        width: 16,
                        height: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "$cal ",
                      style: TextStyle(
                        color:
                            Theme.of(context).textTheme.headlineLarge!.color!,
                      ),
                    ),
                    TextWithFont().textShow(
                        color:
                            Theme.of(context).textTheme.headlineLarge!.color!,
                        fontSize: 14.sp,
                        text: 'Kcal'.tr,
                        fontWeight: FontWeight.w600),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
