import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/constants/static_data/my_string.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/auth/auth_controllers.dart';
import 'package:tashil_food_app/routes/screen_name.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/auth/login/login_with.dart';
import '../../widgets/auth/login/forgot_password.dart';

import '../../widgets/auth/login/no_account_text.dart';
import '../../widgets/auth/login/social_login.dart';
import '../../widgets/auth/login/top_image.dart';
import '../../widgets/auth/login/top_title.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
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
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  // height: 0.77.sh,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                    child: Form(
                      key: fromKey,
                      child: Column(
                        children: [
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
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibility
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: authTextFromFieldHintTextColor,
                                          size: 24,
                                        )
                                      : const Icon(
                                          Icons.visibility_outlined,
                                          color: Colors.black,
                                        ),
                                ),
                              );
                            },
                          ),
                          const ForgotPassword(),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return controller.loading
                                ? const CircularProgressIndicator()
                                : Column(
                                    children: [
                                      AuthButton(
                                        text: 'Login'.tr,
                                        press: () {
                                          if (fromKey.currentState!.validate()) {
                                            String email =
                                                emailController.text.trim();
                                            String password =
                                                passwordController.text;
              
                                            controller.login(
                                                email: email, password: password);
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      AuthButton(
                                        text: 'Access as Guest'.tr,
                                        backcolor: Colors.grey.shade400,
                                        color : Theme.of(context).iconTheme.color,
                                        press: () {
                                          Get.toNamed(ScreenName.mainScreen);
                                        },
                                      ),
                                    ],
                                  );
                          }),
                          SizedBox(
                            height: 20.h,
                          ),
                          const NoAccountText(),
                          SizedBox(
                            height: 45.h,
                          ),
                          const LoginWithText(),
                          const SocialLogin(),
                        ],
                      ),
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
