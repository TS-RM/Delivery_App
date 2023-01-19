import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class AppBarRev extends StatelessWidget with PreferredSizeWidget {
  const AppBarRev({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: TextWithFont().textShow(
          color: Theme.of(context).textTheme.headlineLarge!.color,
          fontSize: 20.sp,
          text: 'Reviews'.tr,
          fontWeight: FontWeight.bold),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
    );
  }
}
