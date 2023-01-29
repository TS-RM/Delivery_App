import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/data/settings/service/settings_service.dart';
import 'package:tashil_food_app/presentation/widgets/splash/bottom_row.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/splash/logo_container.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 178.h,
                width: double.infinity,
              ),
              const LogoContainer(),
              // TextWithFont().textShow(
              //     color: Theme.of(context).textTheme.headlineLarge!.color!,
              //     fontSize: 35.sp,
              //     text: "Foods",
              //     fontWeight: FontWeight.bold),
              SizedBox(
                height: 30.h,
                width: double.infinity,
              ),
              Text(
                'Beautiful eCommerce app for \n resturant'.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).textTheme.headlineLarge!.color!,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 45.h,
                width: double.infinity,
              ),
              SettingsService().getSettingsData() != null
                  ? AuthButton(
                      press: () {
                        Get.toNamed(ScreenName.mainScreen);
                      },
                      text: 'get Started'.tr,
                    )
                  : AuthButton(
                      press: () {
                        Get.toNamed(ScreenName.onBoardingScreen);
                      },
                      text: 'Let\'s get Started'.tr,
                    ),
              SizedBox(
                height: 15.h,
                width: double.infinity,
              ),
              const ButtonRow(),
            ],
          ),
        ),
      ),
    );
  }
}
