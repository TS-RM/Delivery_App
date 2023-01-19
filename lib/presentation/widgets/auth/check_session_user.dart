import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class CheckSessionUser extends StatelessWidget {
  const CheckSessionUser({super.key, required Widget child})
      : _childWidget = child;
  final Widget _childWidget;
  @override
  Widget build(BuildContext context) {
    return SharedPref.instance.getString('token') == null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "You must open an account".tr,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .color!
                        .withOpacity(.5),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed(ScreenName.loginScreen);
                },
                style: ElevatedButton.styleFrom(
                  // shadowColor: Colors.white,
                  side: BorderSide.none,
                  minimumSize: Size(337.w, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                child: TextWithFont().textShow(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  text: 'Log in'.tr,
                ),
              )
            ],
          )
        : _childWidget;
  }
}
