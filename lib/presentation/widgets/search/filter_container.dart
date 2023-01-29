import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? Theme.of(context).textTheme.headlineSmall!.color
            : authTextFromFieldHintTextColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(
          Icons.filter_list_alt,
          color: mainColor.withOpacity(0.8),
        ),
        onPressed: () {
          Get.toNamed(
            ScreenName.filterScreen,
          );
        },
      ),
    );
  }
}
