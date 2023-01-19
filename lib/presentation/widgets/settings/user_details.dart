import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';

import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
    required this.settingsController,
  }) : super(key: key);
  final SettingsController settingsController;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Get.isDarkMode ? Colors.white : Colors.blue,
            child: ClipOval(
              child: settingsController.image.value == 'null'
                  ? Image.asset(
                      'assets/images/icons/person.png',
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl: settingsController.image.value,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/icons/person.png',
                        fit: BoxFit.cover,
                      ),
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWithFont().textShow(
                  color: Theme.of(context).textTheme.headlineLarge!.color,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                  text: SharedPref.instance.getString('token') == null
                      ? 'unknown'.tr
                      : "${settingsController.firstName.value} ${settingsController.lastName.value}"),
              TextWithFont().textShow(
                  color: Theme.of(context).textTheme.headlineLarge!.color,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                  text: SharedPref.instance.getString('token') == null
                      ? 'unknown'.tr
                      : settingsController.email.value),
            ],
          )
        ],
      ),
    );
  }
}
