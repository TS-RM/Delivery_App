import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/input_formatters.dart';
import 'package:tashil_food_app/constants/static_data/my_string.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/auth/auth_controllers.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/auth/login/top_image.dart';
import '../../widgets/auth/register/have_account_text.dart';
import '../../widgets/auth/register/top_title.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopImage(),
              SizedBox(
                width: double.infinity,
                height: 20.h,
              ),
              const TopTitle(),
              SizedBox(
                width: double.infinity,
                // height: 0.85.sh,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25, top: 20),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        // name TextFromField
                        AuthTextFromField(
                          controller: firstNameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(InputFormatters.patternName)
                                    .hasMatch(value)) {
                              return 'Enter valid name'.tr;
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            size: 24,
                            color: authTextFromFieldHintTextColor,
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'First name'.tr,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        AuthTextFromField(
                          controller: lastNameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(InputFormatters.patternName)
                                    .hasMatch(value)) {
                              return 'Enter valid name'.tr;
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            size: 24,
                            color: authTextFromFieldHintTextColor,
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'Last name'.tr,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        // email TextFromField

                        AuthTextFromField(
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
                            Icons.email_outlined,
                            size: 24,
                            color: authTextFromFieldHintTextColor,
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'Email'.tr,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        // phone TextFromField

                        AuthTextFromField(
                          controller: phoneController,
                          obscureText: false,
                          validator: (value) {
                            if (value.length != 9) {
                              return 'Mobile Number must be of 10 digit'.tr;
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.phone_outlined,
                            size: 24,
                            color: authTextFromFieldHintTextColor,
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'Phone number'.tr,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        // password TextFromField

                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibility ? true : false,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters'
                                      .tr;
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                size: 24,
                                color: authTextFromFieldHintTextColor,
                              ),
                              hintText: 'Password'.tr,
                              suffixIcon: const Text(""),
                            );
                          },
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return controller.loading
                              ? CircularProgressIndicator()
                              : AuthButton(
                                  text: 'Register'.tr,
                                  press: () {
                                    if (fromKey.currentState!.validate()) {
                                      String firstName =
                                          firstNameController.text.trim();
                                      String lastName =
                                          lastNameController.text.trim();
                                      String email =
                                          emailController.text.trim();
                                      String password =
                                          passwordController.text.trim();
                                      String phone =
                                          phoneController.text.trim();
                                      controller.signUp(
                                        phone: phone,
                                        firstName: firstName,
                                        lastName: lastName,
                                        password: password,
                                        email: email,
                                      );
                                    }
                                  },
                                );
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        const HaveAccountText(),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
