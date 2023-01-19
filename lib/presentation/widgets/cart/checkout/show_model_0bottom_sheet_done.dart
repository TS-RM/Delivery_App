import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/path_const/image_asset.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../auth/auth_button.dart';

Future<dynamic> showModalBottomSheetDone(BuildContext context) {
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).cardColor,
          height: Get.height * 0.82,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              Image.asset(
                ImageAsset.vector4,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Thank You!",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWithFont().textShow(
                color: mainColor,
                text: 'for your order',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextWithFont().textShow(
                  color: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .color!
                      .withOpacity(.6),
                  text:
                      "Your order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your order",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: AuthButton(
                      text: "Track My Order",
                      press: () {},
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(ScreenName.homeScreen);
                  },
                  child: Text(
                    "Back To Home",
                    style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .color!
                          .withOpacity(.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
}
