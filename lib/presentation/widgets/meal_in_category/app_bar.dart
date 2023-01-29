import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarRes extends StatelessWidget with PreferredSizeWidget {
  AppBarRes({
    Key? key,
  }) : super(key: key);
  final dynamic argumentData = Get.arguments;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        argumentData[0]["name"] ?? '',
        style: TextStyle(
            color: Theme.of(context).textTheme.headlineLarge!.color,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp),
      ),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).textTheme.headlineLarge!.color,
          size: 20,
        ),
      ),
    );
  }
}
