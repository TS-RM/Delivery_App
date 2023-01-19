import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class AppBarProfile extends StatelessWidget with PreferredSizeWidget {
  AppBarProfile({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        "Profile".tr,
        style: TextStyle(
          color: Theme.of(context).textTheme.headlineLarge!.color,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp
        ),
      ),
      actions: [
        TextButton(
          onPressed: (() {
            Get.toNamed(ScreenName.editProfile);
          }),
          child: Icon(
            Icons.edit,
            color: mainColor,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
    );
  }
}
