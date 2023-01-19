import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextWithFont().textShow(
          text: 'Search'.tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.headlineLarge!.color),
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).textTheme.headlineLarge!.color,
          size: 20,
        ),
      ),
    );
  }
}
