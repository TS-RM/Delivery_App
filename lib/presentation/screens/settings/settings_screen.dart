import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';
import 'package:tashil_food_app/presentation/widgets/settings/csutom_card.dart';
import 'package:tashil_food_app/presentation/widgets/settings/drop_down_menu_item_language.dart';
import 'package:tashil_food_app/presentation/widgets/settings/row_with_out_switch_password.dart';
import 'package:tashil_food_app/presentation/widgets/settings/row_with_out_switch_profile.dart';
import 'package:tashil_food_app/presentation/widgets/settings/row_with_switch_notification.dart';
import 'package:tashil_food_app/presentation/widgets/settings/row_with_switch_theme.dart';
import 'package:tashil_food_app/presentation/widgets/settings/user_details.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'dart:math' as math;

import 'package:tashil_food_app/routes/screen_name.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30).r,
        child: Column(
          children: [
            UserDetails(
              settingsController: settingController,
            ),
            SizedBox(
              height: 15.h,
            ),
            const CustomCard(),
            SizedBox(
              height: 15.h,
            ),
            Card(
              color: Theme.of(context).secondaryHeaderColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
                child: Column(
                  children: [
                    RowWithoutSwitchProfile(
                      text: 'Manage Profile'.tr,
                      icon: Icons.person_outline,
                      paddingSize: 0,
                      sizedBoxWidth: 120.w,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    RowWithoutSwitchPassword(
                      text: 'Change Password'.tr,
                      icon: Icons.lock_outline,
                      paddingSize: 0,
                      sizedBoxWidth:
                          Get.locale!.languageCode == 'en' ? 100.w : 124.w,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    // RowWithSwitchNotification(
                    //   text: 'Notification'.tr,
                    //   icon: Icons.notifications_none_outlined,
                    //   paddingSize: 110.w,
                    // ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const DropdownMenuItemLanguage(),
                    SizedBox(
                      height: 5.h,
                    ),
                    RowWithSwitchTheme(
                      text: 'Theme Mode'.tr,
                      icon: Icons.color_lens_outlined,
                      paddingSize: 100.w,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SharedPref.instance.getString('token') == null
                        ? GestureDetector(
                            onTap: () {
                              print('login from settings');
                              Get.offAndToNamed(ScreenName.loginScreen);
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.login_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color,
                              ),
                              title: TextWithFont().textShow(
                                text: 'Login'.tr,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              print('logout');
                              settingController.logout();
                            },
                            child: ListTile(
                              leading: Transform.rotate(
                                  angle: 180 * math.pi / 180,
                                  child: Icon(
                                    Icons.logout_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .color,
                                  )),
                              title: TextWithFont().textShow(
                                text: 'Logout'.tr,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
