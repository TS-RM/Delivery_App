import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';

import '../auth/preferred_size_in_app_bar.dart';

class AppBarCart extends StatelessWidget with PreferredSizeWidget {
  const AppBarCart({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      bottom: const PreferredSizeInAppBar(),
      title: Text(
        'Your Carts'.tr,
        style: TextStyle(
            fontSize: 20.sp,
            color: Theme.of(context).textTheme.headlineLarge!.color,
            fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      actions: [
        SharedPref.instance.getString('token') == null
            ? const SizedBox()
            : IconButton(onPressed: onPressed, icon: const Icon(Icons.delete))
      ],
    );
  }
}
