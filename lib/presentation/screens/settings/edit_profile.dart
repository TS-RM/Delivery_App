import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';
import 'package:tashil_food_app/presentation/widgets/auth/auth_button.dart';
import 'package:tashil_food_app/presentation/widgets/auth/new_password_screen/new_password_screen.dart';
import 'package:tashil_food_app/presentation/widgets/profile/view_image.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        settingController.deleteChoose();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: TextWithFont().textShow(
            text: 'Eidt Profile'.tr,
            color: Theme.of(context).textTheme.headlineLarge!.color,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp
          ),
          elevation: 0,
        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextWithFont().textShow(
                        text: "You can update your profile".tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .color!
                            .withOpacity(.4),
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 20,
                    ),
                    ViewImage(
                      editable: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Column(children: [
                        AuthTextFromFieldForget(
                          controller: firstNameController,
                          obscureText: false,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'this field is required, please fill it out'
                                  .tr;
                            }
                            return null;
                          },
                          hintText: 'First name'.tr,
                          suffixIcon: const Text(""),
                          prefixIcon: const Text(""),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        AuthTextFromFieldForget(
                          controller: lastNameController,
                          obscureText: false,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'this field is required, please fill it out'
                                  .tr;
                            }
                            return null;
                          },
                          hintText: 'Last name'.tr,
                          suffixIcon: const Text(""),
                          prefixIcon: const Text(""),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        AuthTextFromFieldForget(
                          controller: phoneController,
                          obscureText: false,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'this field is required, please fill it out'
                                  .tr;
                            }

                            // if (val != RegExpMatch(val)) {
                            //   return 'Not Match'.tr;
                            // }
                            return null;
                          },
                          hintText: 'Phone number'.tr,
                          suffixIcon: const Text(""),
                          prefixIcon: const Text(""),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GetBuilder<SettingsController>(builder: (_) {
                      return settingController.loading
                          ? Center(
                              child:
                                  CircularProgressIndicator(color: mainColor),
                            )
                          : Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: AuthButton(
                                text: 'Update'.tr,
                                press: SharedPref.instance.getString('token') ==
                                        null
                                    ? null
                                    : () {
                                        final isValid =
                                            formKey.currentState!.validate();
                                        if (isValid) {
                                          settingController.save(
                                              fName:
                                                  firstNameController.text.trim(),
                                              lName:
                                                  lastNameController.text.trim(),
                                              phoneNumber:
                                                  phoneController.text.trim());
                                        }
                                      },
                              ),
                          );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
