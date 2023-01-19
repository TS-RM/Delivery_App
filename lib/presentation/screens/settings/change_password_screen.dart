import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/my_string.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/auth/auth_controllers.dart';
import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/new_password_screen/new_password_screen.dart';

class UpdatePassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final settingController = Get.find<SettingsController>();

  UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: TextWithFont().textShow(
          text: 'Change Password'.tr,
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextWithFont().textShow(
                      text:
                          "Please enter your email to recieve a link to create a new password via email"
                              .tr
                              .tr,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .color!
                          .withOpacity(.4),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _form,
                    child: Column(children: [
                      AuthTextFromFieldForget(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Invalid email'.tr;
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          size: 24,
                          color: authTextFromFieldHintTextColor,
                        ),
                        hintText: 'Email'.tr,
                        suffixIcon: const Text(""),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<SettingsController>(builder: (_) {
                    return settingController.loading
                        ? Center(
                            child: CircularProgressIndicator(color: mainColor),
                          )
                        : AuthButton(
                            text: 'Update Password'.tr,
                            press: () {
                              if (_form.currentState!.validate()) {
                                String email = emailController.text.trim();
                                settingController.changePassword(
                                  email: email,
                                );
                              }
                            });
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
