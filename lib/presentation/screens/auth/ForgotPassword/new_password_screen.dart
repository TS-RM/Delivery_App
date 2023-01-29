import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/auth/auth_controllers.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import '../../../widgets/auth/auth_button.dart';
import '../../../widgets/auth/new_password_screen/new_password_screen.dart';

class NewPwScreen extends StatelessWidget {
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  NewPwScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var one = Get.arguments;
    // print(one[0]['code']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: TextWithFont().textShow(
            text: 'New Password',
            color: Theme.of(context).textTheme.headlineLarge!.color,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp),
        elevation: 0,
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // TextWithFont().textShow(
                //     text: "New Password",
                //     fontSize: 20.sp,
                //     fontWeight: FontWeight.w500,
                //     color: Colors.black.withOpacity(.6)),
                const SizedBox(
                  height: 20,
                ),
                TextWithFont().textShow(
                    text:
                        "Please enter your email to recieve a link to create a new password via email",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(.4),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _form,
                  child: Column(children: [
                    AuthTextFromFieldForget(
                      controller: passwordController,
                      obscureText: false,
                      validator: (val) {
                        if (val.isEmpty) return 'Empty';
                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        size: 24,
                        color: authTextFromFieldHintTextColor,
                      ),
                      hintText: 'Password',
                      suffixIcon: const Text(""),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AuthTextFromFieldForget(
                      controller: confirmController,
                      obscureText: false,
                      validator: (val) {
                        if (val.isEmpty) return 'Empty';

                        if (val != passwordController.text) return 'Not Match';

                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        size: 24,
                        color: authTextFromFieldHintTextColor,
                      ),
                      hintText: 'Confirm Password',
                      suffixIcon: const Text(""),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return controller.loading
                      ? const CircularProgressIndicator()
                      : AuthButton(
                          text: 'Update Password',
                          press: () {
                            if (_form.currentState!.validate()) {
                              String password = passwordController.text;

                              // controller.resetPasswordStep3(
                              //     code: '${one[0]['code']}',
                              //     password: password);
                            }
                          });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//      Scaffold(
//         backgroundColor: context.theme.backgroundColor,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor:  context.theme.appBarTheme.backgroundColor,
//         title: TextWithFont().textWithRobotoFont(
//             text: 'Forget Password',
//             fontSize: 20.sp,
//             fontWeight: FontWeight.bold,
//             color: mainColor),
//         bottom: const PreferredSizeInAppBar(),
//         leading: GestureDetector(
//           onTap: () => Get.back(),
//           child:  Icon(
//             Icons.arrow_back_ios,
//             color: Get.isDarkMode ?Colors.white: Colors.black,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 55.h,
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: TextWithFont().textWithRobotoFont(
//                   text: 'Please sign up to enter in app ',
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.bold,
//                   color: titleForgotPasswordScreen,
//                   textAlign: TextAlign.center),
//             ),
//             SizedBox(
//               height: 38.h,
//             ),
            // Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20.w),
            //     child: Form(
            //       key: _form,
            //       child: Column(children: [
            //         AuthTextFromField(
            //           controller: passwordController,
            //           obscureText: false,
            //           validator: (val) {
            //             if (val.isEmpty) return 'Empty';
            //             return null;
            //           },
            //           prefixIcon: const Icon(
            //             Icons.lock_outline,
            //             size: 24,
            //             color: authTextFromFieldHintTextColor,
            //           ),
            //           hintText: 'Password',
            //           suffixIcon: const Text(""),
            //         ),
            //         SizedBox(
            //           height: 20.h,
            //         ),
            //         AuthTextFromField(
            //           controller: confirmController,
            //           obscureText: false,
            //           validator: (val) {
            //             if (val.isEmpty) return 'Empty';

            //             if (val != passwordController.text) return 'Not Match';

            //             return null;
            //           },
            //           prefixIcon: const Icon(
            //             Icons.lock_outline,
            //             size: 24,
            //             color: authTextFromFieldHintTextColor,
            //           ),
            //           hintText: 'Confirm Password',
            //           suffixIcon: const Text(""),
            //         ),
            //       ]),
            //     )),
//             SizedBox(
//               height: 108.h,
//             ),
//             AuthButton(
//               text: 'Update Password',
//               onPressed: () {
//                 _form.currentState?.validate();

//                 // Get.toNamed(Routes.forgotPasswordCodeScreen);
//                 // emailController.text.isEmpty
//                 //     ? _validate = true
//                 //     : _validate = false;
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
