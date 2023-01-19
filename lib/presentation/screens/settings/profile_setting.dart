import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';

import '../../widgets/profile/app_bar_profile.dart';
import '../../widgets/profile/custom_row.dart';
import '../../widgets/profile/view_image.dart';

class ProfileSetting extends StatelessWidget {
  ProfileSetting({Key? key}) : super(key: key);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(),
      body: SharedPref.instance.getString('token') == null
          ? Center(
              child: Text(
                "You must open an account".tr,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  ViewImage(editable: false),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Card(
                      color: Theme.of(context).secondaryHeaderColor,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 25.h),
                        child: Column(
                          children: [
                            CustomRow(
                              icon: Icons.person_outline,
                              text: settingController.firstName.value,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomRow(
                              icon: Icons.person_outline,
                              text: settingController.lastName.value,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomRow(
                              icon: Icons.email_outlined,
                              text: settingController.email.value,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            CustomRow(
                              icon: Icons.phone_outlined,
                              text: settingController.phone.value,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
