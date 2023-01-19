import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/my_string.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/auth/auth_controllers.dart';
import 'package:tashil_food_app/presentation/widgets/auth/new_password_screen/new_password_screen.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

import '../../../widgets/auth/auth_button.dart';
import '../../../widgets/auth/forgot_password/text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWithFont().textShow(
            text: 'Change Password'.tr,
            color: Theme.of(context).textTheme.headlineLarge!.color,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp),
        elevation: 0,
      ),
      body: SizedBox(
        width: Get.width,
        // height: Get.height,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Form(
              key: fromKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),

                  TextWithFont().textShow(
                      text:
                          "Please enter your email to recieve a link to create a new password via email"
                              .tr,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .color!
                          .withOpacity(.4),
                      textAlign: TextAlign.center),

                  SizedBox(
                    height: 40.h,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GetBuilder<AuthController>(builder: (_) {
                      return AuthTextFromFieldForget(
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
                      );
                    }),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  // Spacer(),
                  GetBuilder<AuthController>(builder: (_) {
                    return controller.loading
                        ? const CircularProgressIndicator()
                        : AuthButton(
                            text: 'Update Password'.tr,
                            press: () {
                              if (fromKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                controller.resetPassword(email: email);
                              }
                            },
                          );
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

//     Scaffold(
//       backgroundColor: context.theme.backgroundColor,
//       appBar: AppBarForgot(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 55.h,
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: TextWithFont().textWithRobotoFont(
//                   text: 'Enter email address for \n send code',
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.bold,
//                   color: titleForgotPasswordScreen,
//                   textAlign: TextAlign.center),
//             ),
//             SizedBox(
//               height: 38.h,
//             ),
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 35.w),
//   child: GetBuilder<AuthController>(builder: (_) {
//     return TextField(
//         controller: emailController,
//         // validator:
//         decoration: InputDecoration(
//           errorText: controller.validate == false
//               ? 'Value Can\'t Be Empty'
//               : null,
//           contentPadding:
//               const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide:
//                 const BorderSide(color: appBarPreferredSizeColor),
//             borderRadius: BorderRadius.circular(0),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 color: authTextFromFieldErrorBorderColor),
//             borderRadius: BorderRadius.circular(0),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 color: authTextFromFieldErrorBorderColor),
//             borderRadius: BorderRadius.circular(0),
//           ),
//           hintText: 'Email',
//           prefixIcon: const Icon(
//             Icons.email_outlined,
//             size: 24,
//             color: authTextFromFieldHintTextColor,
//           ),
//           hintStyle: TextStyle(
//             color: authTextFromFieldHintTextColor,
//             fontSize: 17.sp,
//             fontWeight: FontWeight.w500,
//           ),
//         ));
//   }),
//             ),
//             SizedBox(
//               height: 160.h,
//             ),
//             // GetBuilder<AuthController>(builder: (_) {
//             //   return

//             AuthButton(
//               text: 'Send Code',
//               onPressed: () {
//                 Get.toNamed(Routes.forgotPasswordCodeScreen);

// emailController.text.isEmpty
//     ? controller.validaterFalse()
//     : controller.validaterTrue();
//               },
//               //   );
//               // }
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
