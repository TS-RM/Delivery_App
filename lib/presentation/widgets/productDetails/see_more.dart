import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "See More".tr,
      style: TextStyle(
        color: mainColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
